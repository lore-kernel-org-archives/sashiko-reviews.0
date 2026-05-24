Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023085.outbound.protection.outlook.com [40.107.162.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6325B0A9;
	Sun, 24 May 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.85
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620455; cv=fail; b=GVnnmfBKzmPWwYRedO2w+OoMb5Mqq6GGFjBE/ycNpjRH5sNFiZxJgyOsaxX5N4UxgFpzl1s0lu14iFgKw4KlF/RLTsPyZm4x8ne+eUssHcspCgq4iEeAoGVKBY1ZbYz0r5rioLwMouBOUAA4rchB7NO9xAdH6jss0CIswthTPeE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620455; c=relaxed/simple;
	bh=zpnZ8YgJSm/oKxXEGamMgzZ3POr9cyRdbWjNqu1qXW0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HqYE09cQfGEFZwQuHrIVufQQCJMFg6fV2xb2yLqlO7p7mhMx5JChZopGk6W8kVtgT9F7l/QezxH19LuLArddth50MDU569kiFGcwhFmizI6OkPZTJ6BwapappYV93nuDI2b0bTLOikUJFNlDsRZzRqlyDsL7EzA/LwHiVU4eN00=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=AT7d5DLA; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=AT7d5DLA; arc=fail smtp.client-ip=40.107.162.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="AT7d5DLA";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="AT7d5DLA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=GuVd9oQkUabpmZZbqZP91fiGDn4OLTxVMSvuWEnfR2QCUrZaQNzNbXSl0DqYd9SXPJscrV/biBmDdFEKPbI/LSfuG+pp5ZKnAprlHeafiO6yQwLvVG2R29ITlr+KL+Y0DLWGM9AZGBMmkOMvsBTe7tRHvgTsQj1CRuyuVBNJdRGzAh4gEAKl4U14tX8fMCNoENO8JUuWSq4q9irjhyEylhIwrdhhquClR97DCRtPG6LJoipQ9IFVt3dJjeJCdRydfhprqHJp5o9HHiWVZRNOTZnAORn9a9nsSdfYPX4B/YgPwS4qfg2KUs90WVSl9ViZIRUR+A/zEyzCtqzFhPHfYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpnZ8YgJSm/oKxXEGamMgzZ3POr9cyRdbWjNqu1qXW0=;
 b=Kc8TueJ7TBnj9NtWUlFl2+pBFBQUPDWsZ6b69u3B2BkTJJXAQeNVJ+5G8m4epO4agaSJgSi/B/i0/bqKqVAm60wbioUJAz0rQykuR0gF9sz3PZT/qsykCrkr7SPUMUOwdVvK31CjZ+JU38UTzDRe16k2foR62a9NOHXo8W+y16K9c4J8aAl/DnLLt7KzVONVXlDyVlIDWXwBreXW6Nh1FK9eJMG9sLUckXB7NrhzHbhoip7O/sZZB+9GNyihRzVEz1IH6DHbKMe2p3hwTXG97GRA3p15H46OS2p/4B+XfMfosYufCV/ob+NO7x2lODmLFFQccSpEYQ+ojDlv7HeH8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpnZ8YgJSm/oKxXEGamMgzZ3POr9cyRdbWjNqu1qXW0=;
 b=AT7d5DLAwtWR1X3Lttl1vqHbDKZvUlPYjhwPrDq0byClUBTUBu31RBpoFQoqF+ItTOx8SVbgyRLStqWcwY8fQ8bjaWnvCEsVHcqsF/G4nbmpow84CdwDL5ZVKYJsOaCgWZjcfxJ46zVMelOulSvifK2joWquTcTlbbbrcImfqj94FIXf3wxMWWEskmVRid5SqxQQhGEV+NSNoDDaOXPXXCbPCwZTIs3nF+MLIqwvlb+SrEDH5LrMU0TkrdSoQfoBBNJMT/Q+QHpSs5AkTHr4KwLMGAhnvrQ3n9cHQwM/D2lGLNnRcNOYtOE0JBYSl9IGy4U8SOyU7Rdj40DPhQs19A==
Received: from AS4P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::17)
 by DB9PR04MB11659.eurprd04.prod.outlook.com (2603:10a6:10:607::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 11:00:48 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::28) by AS4P192CA0027.outlook.office365.com
 (2603:10a6:20b:5e1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 11:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 11:00:48 +0000
Received: from emails-2659789-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E72727FE27;
	Sun, 24 May 2026 11:00:47 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 11:00:39 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgdMb8rT/6N/VzFjCSCIJzeiCGUE19ZNo4aNjrwzPup5vSpETQLHqaEyGz0lhp6KVzaoaxg7A6J1PM+MGKNbbnjd6FfbiHeWy9s+F1XDBnL2XT7WFkr8Tvxu/eSqUgfbAEW+mxnB+1ZkGeUFnwHyUgjtJjQXRblFLhupjLv2lF4brPonctFK6kf/lxKwhZ4qDgbjGa+FFolBIde++EMpxrRrnG44OBWZ5eAN3pJy3/h2KN4QqvxLak97ItrKjvKafCQ7dIRyhTYDY3GZ3ArfaXQHB6arKDLFR0OHsYQQTzZjQRrwmdFRQvWjwZ6SoflRTMMZLGLmq3Q9GNJiveikXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpnZ8YgJSm/oKxXEGamMgzZ3POr9cyRdbWjNqu1qXW0=;
 b=IIYB+p8BNVxzt83GVzMvcpalJbjVnQcCgRgioEPSptkeGKPKWLNRLDNeqqcVMmNb6GkUtdQLG8K6hTafuRuDAA3WTgAL0/k+dbjTRmMRGOnKsw+vwWl9tPoFWNNoNf6dx/B8akSszB2MMQiz8hVYOUrQiNLQ7AWL4J1HLXMP6XNcki5naWdilGwV9wvcRc+9oDsRJ8KTTZqymPJbSOCuLtI3imJjIlb10bzpioNnhWEmaDuHK4jlJnh4zelvVERxSxB873RIuN+N3Xbz3229CHA1M+YuaQiH5oaWK5tMhZptKpyXAtbDAFeBla6S1TRN5ZvWQOsDZRNQtHi8uUQfvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpnZ8YgJSm/oKxXEGamMgzZ3POr9cyRdbWjNqu1qXW0=;
 b=AT7d5DLAwtWR1X3Lttl1vqHbDKZvUlPYjhwPrDq0byClUBTUBu31RBpoFQoqF+ItTOx8SVbgyRLStqWcwY8fQ8bjaWnvCEsVHcqsF/G4nbmpow84CdwDL5ZVKYJsOaCgWZjcfxJ46zVMelOulSvifK2joWquTcTlbbbrcImfqj94FIXf3wxMWWEskmVRid5SqxQQhGEV+NSNoDDaOXPXXCbPCwZTIs3nF+MLIqwvlb+SrEDH5LrMU0TkrdSoQfoBBNJMT/Q+QHpSs5AkTHr4KwLMGAhnvrQ3n9cHQwM/D2lGLNnRcNOYtOE0JBYSl9IGy4U8SOyU7Rdj40DPhQs19A==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by AMBPR04MB12565.eurprd04.prod.outlook.com (2603:10a6:20b:778::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 11:00:38 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 11:00:37 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Topic: [PATCH v5 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Index: AQHc4sPVzsTlS12eqUe1ajckj+XSx7YNVR4AgA++dIA=
Date: Sun, 24 May 2026 11:00:37 +0000
Message-ID: <82d05d95-e3ba-44a6-b9fa-663cb79e2978@solid-run.com>
References: <20260513-imx8dxl-sr-som-v5-2-d0899b371c38@solid-run.com>
 <20260514103504.A1F8FC2BCB3@smtp.kernel.org>
In-Reply-To: <20260514103504.A1F8FC2BCB3@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	DB8PR04MB6859:EE_|AMBPR04MB12565:EE_|AM3PEPF0000A79C:EE_|DB9PR04MB11659:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a6a8fc-5600-4299-7d8b-08deb983b63f
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 OLwpP+IHkSvjSWc2XJsc8U2Vgoav61UkG9xXHP1XApIMATYER3c615AuNHeNyFl/mY9KidvjfmgyLJsVcbJJYVtqp5uEKq5wVn/ofd/8IKNhsPcVAzEt+PwOBqGb3PIQ3nwM4Ch7LZNlPdQnaCfaWQydP6thq9sN/TZ+hXxfL2zvi3b5lVIFRZLssskNCiO3EhLfoH/J+eBRm+gRn/MSj4Xl+9K5XzOwRdJ3eFdJxBRGnQgYdPgvOzn+i/1ST4Waf1v0AKKdIEahiO9kZw5xhSf0Ho+Kh+iE2qbhj3Foxow4YpFpaSycefMvxJLQL44MmSTV6cQ5AcabSgPtYxLJ+HDNDykKw12LpQulhohZs5zUISBKvD5mLiU/Yq5bxqUAfQjQm3txm7KWFesRT0r2Co4COg/ZomKQxJU9SWX/Y7iOWIpeYKL2BLHpb1/r76gGswP3AAYuaVHEOO8dOxRqr/473lTO0M88TPF56WAcNGwck5kGsge2eQ6ZqME7eS9WD8C5v/+aevfMnCfhSsrqT9MaR8SAPskKrjljkVFifKdSwZa0MwdIJ/pJZciyWt4VlHM+gps/HMJI16gWOiIz0Tc2cCjhhpeWYhFf2aNISLPksOxU0vbpg8KejDZSPD1xzAej2iC5tcla9lEhItfJU+Sz+3PvJx51ZBNhb2y6kiDYxYvtBDolNTBq4lDCa/+v2+Rd+Z7lrD2EWjoOR4alAIgh03ZZJCo0PtgMfa+bXlyVuQFjsy/BVDvvhWq5yTLn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003)(3023799007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F35BD599B9BE3D4084616216109EA357@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 eyfsrR7bR4AzwKwxcdV3kJAgv+f4jpjXc9+hMUfRpA/NdBcUjCsl7+eHQ51FDwj6IijjGu+6rS9AjxqXx3xupExJlN4sA6naUTl5pWjL61W0spdEsl1FVuUSnN4zflBU6nb3bMcQZaPjC4+xkkyhsp5TLP9vXPYU3+IjvWbtrI9WMufiRUiofBN4G9SRSCNF9JniuBoKAwf6USD8RyLQvpCL/cWdNiCGLkR0rcFDnTPSLdHxTrkpKtBR7XMKJVEy92dXUiTNRlcgMBPKhuUbZ3rS/JpzGlr6648xr/9XJ3syeoQnw6hK5Jx09QgmVTrNHGw9QjsayyxGT6uMQrrGWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b93e1c4d26864290b0fedb5fc55a2d90:solidrun,office365_emails,sent,inline:bdc9b41de4a1def6fa76c212f9ce51bb
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44b2badf-b784-4abd-a7f0-08deb983b014
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|14060799003|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	zA5Prza6AeVxVXTqEBRdP28TMoEfeXhZ4E53GcqbVX7B1i0iN0RaERdA9iUL29Zz5+zdQEFnZU6H/DhUjsE6aCrwrg8j8sfW2rfmoVv525C3bwL3Clk1VAfUXkXiKpvBipa4ZWdkzBz/Hb2X9SaOxSw2kgOGIWL2t1SXGtmkT759ituyuSISJxE4KVtHkoQbgthUg9ZFgrXXGbmqr14yuhpFAT2IbiWmy9Gcuzw5LofSyzxox0pOBFdWBRYC1pJPNf15ViUq3Xl+j1vCRVOtPbvYvovbuqy7PNfkMuSF7xEC3IAVvJeix4DxIFCTEsLeYO+J/yeMjUagoQIFV1knr+QQmycKz+fMtV57TCfs+IbJivKdhp9gk6dkPYubX2YnDVKedF1o/iQu8Xn83D1eWiOw+0Ry5G0sHHBT7tp4fbMmQ/eT0lqwiDrIk01zOaD3a1rbZI/gX9NDflFP0GWven8dVvby9a0xOMG+ArS12dtvdt3WanNDSsG5EldUNE6euBY1j5PS3PooLPz7lghJ35x4X5BxJJI0PyZ88m7C8H6+luOxXuQ2W/DoVyGTjTFJZzk0JG1vcGU4JaWsVa+B3e8TcYrFx5dl0I3QBsBVJG19+cg4trjDKCRz+H+ZhHve/ogTv3Zb8sL3QPRuBx8+joYoavN6+deJYC818U3QV8DP/EfuOXwHuJMI7nQRY3T+sT1zRr14UrobeksAnmsGX4MzXM8ozOelrZQdlGpGwmI=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UApvQRKimDck4XqMklCa3FZZ5wuF1OHkBTkuIZxN1SXG8YDaUMezY2LtjVWMj0cUuPdVRtAcpqMq2HgQ8AoygImJFb+qeR9BEBUkpW5I0+jA29McVcJ1/MDTq62FRzqATBtJDleKjApIR6QYmzsBDcIDsgXwlBy5KmevCwmQy1/XIUNUfF4KrwJE9bjJskMyQZaPaSMGrqp2iaKmSH3QBQ6bzG1N0t2dLXtHhXKl/xP0ovUlk9MSBxto6xTLPWHSnTgZg+Y5N7wQoiBj5nazTpALeGGRJx6ZaSBWDyqs5BmKdHf9b1TAi+V/9dXQh0VF9asavtyqVxMEyGxaBlxEtAitS1blDgYUg8WQuXiyVeqouA7kf3Gx0xtmhwvMVl2jtSwonMFFfsSPSFzXA9/vR3tFa0bygeULB1WF6P3EUpNbz5pfJ1IYYSXbBmA9AxYv
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 11:00:48.1628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a6a8fc-5600-4299-7d8b-08deb983b63f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11659

QW0gMTQuMDUuMjYgdW0gMTI6MzUgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAz
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gVGhlIFF1ZWN0ZWwg
Y2VsbHVsYXIgbW9kZW0gKGB1c2ItZGV2aWNlQDFgKSB3aWxsIG5ldmVyIGJlIHBvd2VyZWQgb24g
YmVjYXVzZSBpdHMgRFQgbm9kZSBpcyB1bmhhbmRsZWQuDQo+IC0gW0hpZ2hdIFRoZSBgZXRoZXJu
ZXQxYCBhbGlhcyBpcyBleHBsaWNpdGx5IGFzc2lnbmVkIGJ1dCB0aGVuIGltbWVkaWF0ZWx5IGRl
bGV0ZWQgd2l0aGluIHRoZSBzYW1lIG5vZGUgYmxvY2ssIGJyZWFraW5nIE1BQyBhZGRyZXNzIGFz
c2lnbm1lbnQuDQo+IC0gW01lZGl1bV0gVGhlIGB1c2RoYzJgIGhvc3QgY29udHJvbGxlciBpcyBl
bmFibGVkIGFuZCBtYXJrZWQgYG5vbi1yZW1vdmFibGVgIGZvciBvbWl0dGVkIGhhcmR3YXJlLg0K
PiAtLQ0KPg0KPiBjb21taXQgYTdiYTdlNWMyN2I0MzllYzQ5ODQwMGZlNzYwZTYxY2E4YjBiMDM1
Yw0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPg0KPiBhcm02
NDogZHRzOiBpbXg4ZHhsOiBBZGQgU29saWRSdW4gU29NIGFuZCBIdW1taW5nQm9hcmQNCj4NCj4g
QWRkIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBpLk1YOERYTCBTeXN0ZW0tb24tTW9kdWxlIChy
ZXZpc2lvbiAyLjEpDQo+IGFuZCBpdHMgY29ycmVzcG9uZGluZyBldmFsdWF0aW9uIGNhcnJpZXIg
Ym9hcmQsIHRoZSBIdW1taW5nQm9hcmQNCj4gVGVsZW1hdGljcyAocmV2aXNpb24gMi4wKS4NCj4N
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4ZHhsLWh1
bW1pbmdib2FyZC10ZWxlbWF0aWNzLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhkeGwtaHVtbWluZ2JvYXJkLXRlbGVtYXRpY3MuZHRzDQo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNWY0MmM0ZjJlM2JlOQ0KPj4gLS0tIC9kZXYv
bnVsbA0KPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OGR4bC1odW1t
aW5nYm9hcmQtdGVsZW1hdGljcy5kdHMNCj4+IEBAIC0wLDAgKzEsNTM2IEBADQo+IFsgLi4uIF0N
Cj4+ICsJYWxpYXNlcyB7DQo+PiArCQkvKiBvdmVycmlkZSBldGhlcm5ldCBhbGlhc2VzIGZyb20g
aW14OGR4bC5kdHNpICovDQo+PiArCQlldGhlcm5ldDAgPSAmZXFvczsNCj4+ICsJCWV0aGVybmV0
MSA9ICZzd2l0Y2hfcG9ydDE7DQo+PiArCQlldGhlcm5ldDIgPSAmc3dpdGNoX3BvcnQyOw0KPj4g
KwkJZXRoZXJuZXQzID0gJnN3aXRjaF9wb3J0MzsNCj4+ICsJCWV0aGVybmV0NCA9ICZzd2l0Y2hf
cG9ydDQ7DQo+PiArCQlldGhlcm5ldDUgPSAmc3dpdGNoX3BvcnQ1Ow0KPj4gKwkJZXRoZXJuZXQ2
ID0gJnN3aXRjaF9wb3J0NjsNCj4+ICsJCWV0aGVybmV0NyA9ICZzd2l0Y2hfcG9ydDc7DQo+PiAr
CQlldGhlcm5ldDggPSAmc3dpdGNoX3BvcnQ4Ow0KPj4gKwkJZXRoZXJuZXQ5ID0gJnN3aXRjaF9w
b3J0OTsNCj4+ICsJCWV0aGVybmV0MTAgPSAmc3dpdGNoX3BvcnQxMDsNCj4+ICsJCS9kZWxldGUt
cHJvcGVydHkvIGV0aGVybmV0MTsNCkxlZnRvdmVyIGZyb20gcHJldmlvdXMgcmV2aXNpb24gYmVm
b3JlIHN3aXRjaCBwb3J0cyBoYWQgYWxpYXNlcy4NCkRyb3BwaW5nIGluIHY2Lg0KPiBXaWxsIGRl
bGV0aW5nIHRoaXMgYWxpYXMgYnJlYWsgTUFDIGFkZHJlc3MgYXNzaWdubWVudD8gDQo+DQo+IEJl
Y2F1c2UgdGhlIERldmljZSBUcmVlIENvbXBpbGVyIGV2YWx1YXRlcyBwcm9wZXJ0aWVzIHNlcXVl
bnRpYWxseSB3aXRoaW4gdGhlDQo+IHNhbWUgbm9kZSBibG9jaywgdGhpcyByZW1vdmVzIHRoZSBl
dGhlcm5ldDEgYWxpYXMgZnJvbSB0aGUgZmluYWwgY29tcGlsZWQNCj4gZGV2aWNlIHRyZWUuDQo+
DQo+IFNpbmNlIGJvb3Rsb2FkZXJzIHR5cGljYWxseSBpdGVyYXRlIG92ZXIgZXRoZXJuZXQlZCBh
bGlhc2VzIHN0YXJ0aW5nIGZyb20gMCwNCj4gd29uJ3QgYnJlYWtpbmcgdGhlIHNlcXVlbmNlIGNh
dXNlIHRoZSBpdGVyYXRpb24gdG8gYWJvcnQgcHJlbWF0dXJlbHkgYW5kDQo+IGxlYXZlIHBvcnRz
IDIgdGhyb3VnaCAxMCB3aXRob3V0IE1BQyBhZGRyZXNzZXM/DQo+DQo+IFsgLi4uIF0NCj4+ICsv
KiBjZWxsdWxhciBtb2RlbSAqLw0KPj4gKyZ1c2JvdGcyIHsNCj4gWyAuLi4gXQ0KPj4gKwl1c2It
ZGV2aWNlQDEgew0KPj4gKwkJY29tcGF0aWJsZSA9ICJ1c2IyYzdjLDEyNSI7DQo+PiArCQlyZWcg
PSA8MT47DQo+PiArCQlyZXNldC1ncGlvcyA9IDwmbHNpb19ncGlvMSAxMSBHUElPX0FDVElWRV9M
T1c+Ow0KPj4gKwkJdmJ1cy1zdXBwbHkgPSA8JnZfM18zPjsNCj4+ICsJCXZkZC1zdXBwbHkgPSA8
Jm1vZGVtX3ZiYXQ+Ow0KPj4gKwl9Ow0KPj4gK307DQo+IFdpbGwgdGhpcyBRdWVjdGVsIGNlbGx1
bGFyIG1vZGVtIGV2ZXIgYmUgcG93ZXJlZCBvbj8gDQoNClllcy4gQnkgdGhlIGJsdWV0b290aCBk
cml2ZXIgYmVjYXVzZSBvZiB0aGUgbmFtZSAidmJhdCIgOigNCg0Kcm9vdEA1ODU4MWIxMDliOGU6
fiMgY2F0IC9zeXMvY2xhc3MvcmVndWxhdG9yL3JlZ3VsYXRvci44L3VldmVudA0KT0ZfTkFNRT1y
ZWd1bGF0b3ItbW9kZW0tdmJhdA0KT0ZfRlVMTE5BTUU9L3JlZ3VsYXRvci1tb2RlbS12YmF0DQpP
Rl9DT01QQVRJQkxFXzA9cmVndWxhdG9yLWZpeGVkDQpPRl9DT01QQVRJQkxFX049MQ0Kcm9vdEA1
ODU4MWIxMDliOGU6fiMgY2F0IC9zeXMvY2xhc3MvcmVndWxhdG9yL3JlZ3VsYXRvci44L3N0YXRl
wqANCmVuYWJsZWQNCnJvb3RANTg1ODFiMTA5YjhlOn4jIGNhdCAvc3lzL2NsYXNzL3JlZ3VsYXRv
ci9yZWd1bGF0b3IuOC9jb25zdW1lclw6c2VyaWFsXDpzZXJpYWwwLTAvY29uc3VtZXIvdWV2ZW50
wqANCkRSSVZFUj1oY2lfdWFydF9iY20NCk9GX05BTUU9Ymx1ZXRvb3RoDQpPRl9GVUxMTkFNRT0v
YnVzQDVhMDAwMDAwL3NlcmlhbEA1YTA3MDAwMC9ibHVldG9vdGgNCk9GX0NPTVBBVElCTEVfMD1i
cmNtLGJjbTQzNDVjNQ0KT0ZfQ09NUEFUSUJMRV9OPTENCk1PREFMSUFTPW9mOk5ibHVldG9vdGhU
KG51bGwpQ2JyY20sYmNtNDM0NWM1DQoNCkkgd2lsbCBjaGFuZ2UgdGhpcyBmb3IgdjYsIGhvd2V2
ZXIgZ2V0dGluZyB0aGUgbW9kZW0gdG8gYWN0dWFsbHkgcG93ZXIgb24NCmlzIG5vdCBhIHByaW9y
aXR5IHdoaWxlIHdyaXRpbmcgaGFyZHdhcmUgZGVzY3JpcHRpb24uDQoNCj4NCj4gU2luY2UgZ2Vu
ZXJpYyBVU0IgZGV2aWNlcyBhcmUgZHluYW1pY2FsbHkgZW51bWVyYXRlZCBieSB0aGUgaG9zdCwg
dGhlIGtlcm5lbA0KPiByZWxpZXMgZXhjbHVzaXZlbHkgb24gdGhlIG9uYm9hcmRfdXNiX2RldiBw
bGF0Zm9ybSBkcml2ZXIgdG8gcG93ZXIgdGhlbSB1cA0KPiBiZWZvcmUgZW51bWVyYXRpb24uIA0K
Pg0KPiBTaW5jZSB1c2IyYzdjLDEyNSBpcyBub3QgaW4gdGhlIG9uYm9hcmRfZGV2X21hdGNoIHRh
YmxlIGFuZCB0aGVyZSBpcyBubw0KPiBnZW5lcmljIHBvd2VyIHNlcXVlbmNlIGZhbGxiYWNrIGlu
IHRoZSBVU0IgY29yZSwgd29uJ3QgdGhpcyBub2RlIGJlIGlnbm9yZWQ/DQo+IFRoaXMgd291bGQg
bGVhdmUgbW9kZW1fdmJhdCBkaXNhYmxlZCwgdGhlIHJlc2V0IHBpbiB1bmhhbmRsZWQsIGFuZCB0
aGUgbW9kZW0NCj4gcGh5c2ljYWxseSB1bnBvd2VyZWQgYW5kIGludmlzaWJsZSB0byB0aGUgVVNC
IGhvc3QuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OGR4bC1zci1zb20uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhk
eGwtc3Itc29tLmR0c2kNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAw
MDAwMDAwLi45M2EwZWI0ZDdmNzcwDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4ZHhsLXNyLXNvbS5kdHNpDQo+PiBAQCAtMCwwICsx
LDQ1OCBAQA0KPiBbIC4uLiBdDQo+PiArLyogRFNSQyBSYWRpbyAqLw0KPj4gKyZ1c2RoYzIgew0K
Pj4gKwlidXMtd2lkdGggPSA8ND47DQo+PiArCWtlZXAtcG93ZXItaW4tc3VzcGVuZDsNCj4+ICsJ
bWF4LWZyZXF1ZW5jeSA9IDw0MDAwMDAwMD47DQo+PiArCW5vbi1yZW1vdmFibGU7DQo+IERvZXMg
dGhpcyBjYXVzZSBib290IGRlbGF5cyBhbmQgTU1DIGVudW1lcmF0aW9uIHRpbWVvdXRzPw0KDQpO
by4NCg0KW8KgIMKgMTIuODUzNjg5XSBtbWMyOiBTREhDSSBjb250cm9sbGVyIG9uIDViMDMwMDAw
Lm1tYyBbNWIwMzAwMDAubW1jXSB1c2luZyBBRE1BDQpbwqAgwqAxMy4wMzg3MTldIG1tYzI6IG5l
dyBoaWdoIHNwZWVkIFNESU8gY2FyZCBhdCBhZGRyZXNzIDAwMDENCg0KPg0KPiBUaGUgY29tbWl0
IG1lc3NhZ2Ugbm90ZXMgdGhlIFYyWCBEU1JDIFJhZGlvIHBlcmlwaGVyYWwgZGV2aWNlIG5vZGUg
aXMNCj4gaW50ZW50aW9uYWxseSBvbWl0dGVkIGR1ZSB0byBhIGxhY2sgb2YgdXBzdHJlYW0gYmlu
ZGluZ3MuDQo+DQo+IEJlY2F1c2UgdGhlIGNvbnRyb2xsZXIgZXhwZWN0cyBhIHBlcm1hbmVudGx5
IGF0dGFjaGVkIGNhcmQgYW5kIGlzIG1hcmtlZCBhcw0KPiBub24tcmVtb3ZhYmxlLCB3b24ndCB0
aGUgTU1DIGNvcmUgYXR0ZW1wdCB0byBpbml0aWFsaXplIGl0IGR1cmluZyBib290IGFuZA0KPiBm
YWlsIHNpbmNlIHRoZSBwZXJpcGhlcmFsIHBvd2VyIHNlcXVlbmNlIGFuZCByZXNldHMgYXJlIG5v
dCBkcml2ZW4gYnkgYW55DQo+IG5vZGU/DQo+DQo+IFNob3VsZCB0aGUgaG9zdCBjb250cm9sbGVy
IGJlIG1hcmtlZCB3aXRoIHN0YXR1cyA9ICJkaXNhYmxlZCIgdW50aWwgdGhlDQo+IHBlcmlwaGVy
YWwgaXMgYWN0dWFsbHkgc3VwcG9ydGVkIGFuZCBwcmVzZW50IGluIHRoZSBEVD8NCk5vLiBUaGUg
Y2FyZCBpcyBkZXRlY3RlZCwganVzdCBubyBkcml2ZXIgYmluZHMgdG8gaXQgYmV5b25kIHNkaGku
DQo+DQo+PiArCW5vLXNkOw0KPj4gKwlwaW5jdHJsLTAgPSA8JnVzZGhjMl9waW5zPiwgPCZkc3Jj
X3BpbnM+Ow0KPj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPj4gKwl2bW1jLXN1cHBs
eSA9IDwmdl8zXzM+Ow0KPj4gKwl2cW1tYy1zdXBwbHkgPSA8JnZfMV84PjsNCj4+ICsJc3RhdHVz
ID0gIm9rYXkiOw0KPj4gK307
