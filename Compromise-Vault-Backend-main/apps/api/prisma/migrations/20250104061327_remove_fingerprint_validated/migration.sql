/*
  Warnings:

  - You are about to drop the column `fingerprint_validated` on the `keys` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "keys" DROP COLUMN "fingerprint_validated";
