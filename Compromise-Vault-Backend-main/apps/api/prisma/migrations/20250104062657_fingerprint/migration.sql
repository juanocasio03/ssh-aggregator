/*
  Warnings:

  - Added the required column `fingerprint` to the `keys` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "keys" ADD COLUMN     "fingerprint" TEXT NOT NULL;
