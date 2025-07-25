<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250713063606 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE review ADD CONSTRAINT FK_794381C63C0C9956 FOREIGN KEY (user_account_id) REFERENCES user_account (id)');
        $this->addSql('CREATE INDEX IDX_794381C63C0C9956 ON review (user_account_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE review DROP FOREIGN KEY FK_794381C63C0C9956');
        $this->addSql('DROP INDEX IDX_794381C63C0C9956 ON review');
    }
}
