Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021088.outbound.protection.outlook.com [52.101.70.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D213EAC9E;
	Wed, 13 May 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.88
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665892; cv=fail; b=seBGMq0bPzBY1lj0a1r9bxppjCzq+zhHUdtexMlqtTkBX3r+sJA3Eby+JFj1BBPu43GJpJyX3TPbmqNhNbltd8LhkoAwWk/y+dY+q+ohLCpAvTpISHk/jLh9lpL1mX7OGGDvb7dfYjsN78KWfVarvBN8xWFmVEiq1TnK4UGZEf8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665892; c=relaxed/simple;
	bh=y8GmX8BYpKlLr/iMjbs2AvrY6C0CDzrX/1zkgZmDkaA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UA6WjGk6mybLwnI00hK/juJ7SSI8PUDSux3gb4ZLHxxbAbwKk41ifsQcsZK2D0Rydye6zbW9+s1RuMjz3XPxT7YjqaXljyCGOQZDDD4vpMelQUq38q4DfNa32OfhO0zQZRld17QQg9od8yyOHi1/qUMHHGJQRIV3u5sN59vTrRs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=M/5DQSRc; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=M/5DQSRc; arc=fail smtp.client-ip=52.101.70.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="M/5DQSRc";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="M/5DQSRc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B+jz8SH8FjMJmcR5JC7lVYIAZl1m/ah9momF8wvby9Ye3lstJPiQL5eBIH/E6HIaI83jio2xsyQHO0zqDSPI2AoRO3xPV6heD9c8fjItklay2LXt95ye44sWiiKU9+IM2X3gFOSv4+gcRkz8hyJ6kVxrjrQobUM3HWIMqd/OhNZqNc7QOae6/9ZaCed7iv7XiaIfdnR4Umm8FfZHCMHPkBac1+AHgbNcLv67EAXRFKZ18NNtrgeQt9htBbATANh+wWK+RoG++gtXSk938D8EhGkyrrh3H58lVoMxOQLFvvArr27qyDYDtq+PTInTQ0wMwCVwNH1Ur8b/XAex60QJrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8GmX8BYpKlLr/iMjbs2AvrY6C0CDzrX/1zkgZmDkaA=;
 b=AJOTUtwLt8X7ui9GxoVRQztnmLViYVcG6h2PHNYSSo69YpNiRoFReeNkcl481Zq+5G1fmI613QYsF79EGd+zzxWvYnSuHKdfAwRV5mSK/CIpqJr8KSXiizeGsU52f1yTkjfzW3X6xMf8Sy3IR6q5/rCH3ETIERW2A0dF9gHfnTEBGVbe0YRbArfP/Bqme2pLPLkJn/j6iCJc7m9M3WPFA2+evEKJJqp/6SsD2c5DGfLYYHUH1WEKg+LZZ3FvSf+ewwUqZ6uK27b1MlNP3UiYrDTHah10mIxE2giIWBmb/iwjqJ/bXEMzSbFxS4cMz/3LfOXOYw1n9rWUxB8GN6LnRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8GmX8BYpKlLr/iMjbs2AvrY6C0CDzrX/1zkgZmDkaA=;
 b=M/5DQSRcbZ5Xu8s9kLNPlyYOmXGRRC9pIsvvccNszy9FJP7r7iYgUK1ceRDrPQ+nPPmJk/HdStP1oaSSj4OXNBVVTi4pRInKeZXPrHRSxUvT0VQlMgdUdRzdDjNT1eJ1Qo0DaOcgrTruCKg6c57ZE1E46TSsOBVrjc9g1HFuJVIe+g2WurfzSnkYwDRJWs+jEBLeIk9fq4qVdk2x+89YMY/ZL6TEIAM0beJb1+frNaxUNaqyFcVlnBLfZrrhtME4/1seCQP+rV1miRsXIOvv1/jLO8L9PyHo/nnFpzPNE9mfHMNYTRs4V/DKuIX6G1c73jy1gN6HDHuq6rtg6wBdZQ==
Received: from DUZPR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::20) by DU4PR04MB10744.eurprd04.prod.outlook.com
 (2603:10a6:10:590::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 09:51:22 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::b) by DUZPR01CA0004.outlook.office365.com
 (2603:10a6:10:3c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 09:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Wed, 13 May 2026 09:51:22 +0000
Received: from emails-643927-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7F6517FD69;
	Wed, 13 May 2026 09:51:22 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed May 13 09:51:10 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/IOtmG+K5LZL1ucBbYfvkPxmXmGPIBDKOIOX3mJKf1wMVepRxOCQSvgA8kcx2sg0IISRL4hMILXLgag9Zmn8bSTSBf+b57U71HIw6NhdcIYncCHrPLsqSwJhpuMqoBOXNk8aAyLenLsSc1lXOX3gC8JepZLo60+JKVBmL/0DVyp2nZM0Xe81Ou1cH5akXw0sixDA0bjBg85tVvhwEIsG1ly5NV/UDrqimcd+aRgi4wg4W9HrVGgjzyL6bQ/DHyL5lr254uCK5JH27SH3yeV4BLgDoOA9oBiXs6CRTDZaS/cGtSsRiAuten31aKNCzdkjsIRjkIVZQoIYPMt6bQjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8GmX8BYpKlLr/iMjbs2AvrY6C0CDzrX/1zkgZmDkaA=;
 b=ndgKsFIF7aZIgpoQ8NvUVmthRnhCKMGtG9nyd9+v9+4yPLkpinqtGPNbiGGADJZE4Z196WgxywVOlhIo9v5zXprNS0EAe8I9de3LUGpCy6fhDU2ByJBcEC2fQAZGvzizYlwtNMQFp78HINSt9DSucpKEYYpdKoHlC9G18Aq1WQMi56ayihyWsttSt6FA8kyt7jugUefdsEi8LOTmCXmJFk3vVnZDQrF3DBGzvzcJ6dVtrTi0CbZw+XA6w72E5pRxpHsqKClELtBHRIWupOMEDEexxEvJqMt8KLeSoPKDw9NDsfp8CBrnMSolPdQg2xoz2/FJK7xRv2wwxK+UIsfCXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8GmX8BYpKlLr/iMjbs2AvrY6C0CDzrX/1zkgZmDkaA=;
 b=M/5DQSRcbZ5Xu8s9kLNPlyYOmXGRRC9pIsvvccNszy9FJP7r7iYgUK1ceRDrPQ+nPPmJk/HdStP1oaSSj4OXNBVVTi4pRInKeZXPrHRSxUvT0VQlMgdUdRzdDjNT1eJ1Qo0DaOcgrTruCKg6c57ZE1E46TSsOBVrjc9g1HFuJVIe+g2WurfzSnkYwDRJWs+jEBLeIk9fq4qVdk2x+89YMY/ZL6TEIAM0beJb1+frNaxUNaqyFcVlnBLfZrrhtME4/1seCQP+rV1miRsXIOvv1/jLO8L9PyHo/nnFpzPNE9mfHMNYTRs4V/DKuIX6G1c73jy1gN6HDHuq6rtg6wBdZQ==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by VI0PR04MB11721.eurprd04.prod.outlook.com
 (2603:10a6:800:2ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Wed, 13 May
 2026 09:51:07 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 09:51:07 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Topic: [PATCH v4 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Index: AQHc4S6NPDp3cRKl10uFQFLEqUD7b7YLBT2AgAC0bgA=
Date: Wed, 13 May 2026 09:51:07 +0000
Message-ID: <74f442d7-ef3b-4139-a1b6-99ef74e0b8fa@solid-run.com>
References: <20260511-imx8dxl-sr-som-v4-2-64381b3bf80d@solid-run.com>
 <20260512230520.CC642C2BCB0@smtp.kernel.org>
In-Reply-To: <20260512230520.CC642C2BCB0@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|VI0PR04MB11721:EE_|DB1PEPF0003922E:EE_|DU4PR04MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: fe59b8ed-5277-4b9e-6f96-08deb0d530d6
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|3023799003|56012099003|18092099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 fm7v6t+2CzAxwZio27w7rJWFwlmWKzf0VHI7IBVRkeSGLyxZtwGlMO9KWRLSyizosqDWA04ValRORFqfZuH++uNP0PxVELp7fRoZL8VtZo5s6vqz3SOK8xcN8AvePQBy+zGnw/R9diZPXC4kR35to5aYolFndnp0pMgy/11F1LfYYQ3LTBmMz+SlC9QE1ncl9jeSr/0Z5/m5OwBXPcwyb3HzQsyzuSxou1NCL6Afie9hPHaT9MmG5DphoPlix086MgP8Vh+7G8qEKyrdALGeyBM5MOaTFn3Q/I2GnpagASn5qCVExyll8hyT6P0ivS5nYeWtuqa0Q16S9HTTv+oS6K6M2iyuya65TpjlCwgle7yb/PSKtMLp79mpwNn26i9/sQKRe4GfyibNN5OlZiITaU8xPHuXJegs0/H7t9uGLTxgJF00QlTj1y6np/4q4ycZ6PQ7Tc3VhPJ3i11IH7tLaSbEssVs5JcMiViYBibc8Tb4nQR3nSt0HTQ+W2MTIG0pS1kR7ydowcn8DPKS5LJihPAE9DMFmBhfmDET1DWGV5VLJu8S6KKCsIDxQSMcO6oaisLoSHpd4GdJ8o9QQS2doCtmkZBgXw2G0RQWPbiToyCl/CZV16f8urBQaKtVESwKPSuAP2g6ysPYmZrwkDJ/nyJDFl6hBimHZAaLLeAdUSmF6T1T8RIb66uporASjOfKeQnp958sd9Kw89+DiRqQ1ua/V0aTIkODXZ3+Krh8wOj3Dp3AyMZbPqJrF9Xo2wwW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(3023799003)(56012099003)(18092099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3D4CE8A4814914C8DDDCC89D4D70270@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ERDhrxI2cXwhbljQc0IfIT84j0iWSt3VqCscWxn4DmFVUpQctb3TvhtuywMhKTLJbk7zr/1Y2+uJf5P+R6BWEcsn5sxOfymySlCMffE1UY29Wm6FGnZB9lgSK5K6oeQt9FsTOEzJNgGUJYtR8eD0awYdxgdinbjVtqv0njBUXkDgm3/NKTRl1yuGLWiHNNLgquC081z82l5q0bCFAr0ZNc6EXydqWx5ZUknOyDpdg+FNddrELVgh51c0Km5X4+Zl+EVYot69KeusG3b1VDDbDeYa7Bs1wgZ+BZJYdJVYV+EU3TbAYMLj+cyvFcknHDt/QwPJjgv5APmGuSmH6/WZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11721
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e1e99c5ac6134a51aedd0f41aebcc869:solidrun,office365_emails,sent,inline:94baad3a561dd883e9825c35d2da98e1
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2086c332-1303-4f05-fefe-08deb0d527a3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|1800799024|35042699022|82310400026|18002099003|18092099006|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	J/2+n0zIcuJO6GFRlYrP7wRMz+IUnb7Fd8PTU1tWmfJZg0VU1WDLwgXCuAAnHnIn611h7C+jCzQ1HLD44etBFTNR1cFc7/CmGUKyKS/upNzUfRNBY5vWJJA+6eA0aQyiITPLtG0imG48onAE3O24xJq83qZR0u2A/zl3y/ftaqMpyvD5Cv+V4Uago96IpELVMKwRFvQ5mEcekM4acIQ0bZAvr5/hPO24EU3vdQs4ILDOZiDRlhUmIYqg6UP9WB9uZ+8EGCT6dNLpPrg8TLVLKf7mCI9i7g6taYzkDqfZsow7ehYwIXhGEgz2dPHoeLLfVTQ4sKMraT40lufNRVFghVYpdShXkHfY2/td0pyDkOAMGm7b/OU4z3gDA1/33mL+i4iAvcp4rKDItSPrUEqhQindNo6qoFm5AjLorKW1cjLmvizegVtcmQuRFLWOSYNvpf2SULkOODgtL8Hu/e/ZQB+a/QyvlIbTeJkunFTpwUpUGgZwW66Q+x+gMiCqGFyj60OlK0sWk9VtKUvn969YKrA0fv5DE+KHUBes6aYbu3ufsSaUls7+VQ8igWGuliqglbsDWetSkqlmGc+Gs9WppaelMR72Zus9FPZdXggqVSDwe3oPnKolqD+xSePCMXLsPrG91R8K6Tip7FZqHHlcYP2YTHPljTwi7BBwIFdrYA6oMKJbTr5iX1qfULVGHZOrRsPR4otsCmwbVlM522lF3mq8MonYbU+0L8fV0IJSIAQ=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(82310400026)(18002099003)(18092099006)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	biGhJ5uLAAFJGSbE5m+5XtRq3ZIcMk5KvUfpIIpP1lOR/nJjONqQcJFUmaWQrFpkTeLutHy8bBzkl/e35y6Ry6ENQx97C/uV9LGITVmCAlO679WtftolgdYI9u2ncOe4IaWUabLO78r7XLZ+bEI438WcNBemf8s7duFDOBmPtFsDYo4ju2w1bxNA7m6Uewzbr8wIIXM4lLac8vm04ZxIKhoySXhL55I98hdCFXXuayDYcMelIBBItKqeRg6iYWGidnaAeTEjAV5vOfouAogDT79RZEv8npXgNIqPk4AgGfEz8qokalSMRZy0/KNjGsGb/FvNvy9NTN6vWCGrx+WAfJr2llvMoPt4VNHlkMFw0IlT53zl4iuAi0Rpp2K8Ew7/rWfd3Ehsbu/ExT1owyNzZ/WDdbuTyPNe4zP6IBfZN3IihtxKH8XFEi5MPyMaxci9
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:51:22.6644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe59b8ed-5277-4b9e-6f96-08deb0d530d6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10744

QW0gMTMuMDUuMjYgdW0gMDE6MDUgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCA0
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gVVNCIE9URzEgcG9y
dCBpcyBjb25maWd1cmVkIGFzIHBlcmlwaGVyYWwgYnV0IGJyZWFrcyBvdXQgdG8gYSBUeXBlLUEg
aG9zdCBjb25uZWN0b3IuDQo+IC0gW0hpZ2hdIEluY29uc2lzdGVudCBhbmQgaW5jb3JyZWN0IHBh
ZCBjb25maWd1cmF0aW9ucyBmb3IgSTJDMiBhbmQgSTJDMyBHUElPIHJlY292ZXJ5IHBpbnMuDQo+
IC0gW01lZGl1bV0gVGhlICdyZXNldC1kdXJhdGlvbi11cycgcHJvcGVydHkgaW4gdGhlICd1c2It
ZGV2aWNlQDEnIG5vZGUgaXMgdW5kb2N1bWVudGVkLCB1bnBhcnNlZCBieSBhbnkga2VybmVsIGRy
aXZlciwgYW5kIHdpbGwgZmFpbCBzY2hlbWEgdmFsaWRhdGlvbi4NCj4gLSBbTG93XSBNaXNtYXRj
aCBpbiB0aGUgbnVtYmVyIG9mIDEwMEJhc2UtVDEgYWRkLW9uIHBvcnRzIGJldHdlZW4gY29tbWl0
IG1lc3NhZ2UgYW5kIGRldmljZSB0cmVlLg0KPiAtLQ0KPg0KPiBjb21taXQgZjM4MmM4OWQ3ZGZj
NDkzOGI3M2M3M2M2ODFhMzU0NGY2MzYzNDM1ZQ0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1
YUBzb2xpZC1ydW4uY29tPg0KPg0KPiBhcm02NDogZHRzOiBpbXg4ZHhsOiBBZGQgU29saWRSdW4g
U29NIGFuZCBIdW1taW5nQm9hcmQNCj4NCj4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciB0
aGUgU29saWRSdW4gaS5NWDhEWEwgU3lzdGVtLW9uLU1vZHVsZSBhbmQgaXRzDQo+IEh1bW1pbmdC
b2FyZCBUZWxlbWF0aWNzIGNhcnJpZXIgYm9hcmQuIEl0IGNvbmZpZ3VyZXMgdmFyaW91cyBoYXJk
d2FyZQ0KPiBpbnRlcmZhY2VzIGluY2x1ZGluZyBldGhlcm5ldCwgQ0FOLCBVU0IsIGEgY2VsbHVs
YXIgbW9kZW0sIGFuZCBJMkMgc2Vuc29ycy4NCj4NCj4+IFRoZSBtdWx0aS1pbnRlcmZhY2UgYWRk
LW9uIGJvYXJkIGNvbm5lY3RvciBwcm92aWRlcyBhZGRpdGlvbmFsDQo+PiBpbnRlcmZhY2VzICg0
eCAxMDBCYXNlLVQxLCAyeCBTR01JSSwgVVNCIDIuMCBzaGFyZWQgd2l0aCB0aGUgY2VsbHVsYXIN
Cj4+IG1vZGVtLCBDQU4sIE1ESU8sIFNQSSwgVUFSVCwgUENJZSwgSTJDLCBhbmQgR1BJTykuDQo+
IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCB0aGVyZSBpcyBhIG1pc21hdGNoIGJldHdlZW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGFuZCB0aGUNCj4gZGV2aWNlIHRyZWUuIFRoZSBtZXNzYWdlIG1lbnRpb25z
IDR4IDEwMEJhc2UtVDEgaW50ZXJmYWNlcywgYnV0IHRoZSBjb2RlDQo+IGRlZmluZXMgNSBkaXNh
YmxlZCBwb3J0cyAocG9ydEA1IHRocm91Z2ggcG9ydEA5KSBhbmQgNSBjb3JyZXNwb25kaW5nIFBI
WXMNCj4gZm9yIHRoZSBhZGQtb24gY29ubmVjdG9yLiBDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2Ug
YmUgdXBkYXRlZCB0byBtYXRjaCB0aGUNCj4gaW1wbGVtZW50ZWQgcG9ydHM/DQpRdWV1ZWQgZm9y
IHY1Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhkeGwtaHVtbWluZ2JvYXJkLXRlbGVtYXRpY3MuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OGR4bC1odW1taW5nYm9hcmQtdGVsZW1hdGljcy5kdHMNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAwLi43ZTgyMmNiZDdhNTI4DQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
ZHhsLWh1bW1pbmdib2FyZC10ZWxlbWF0aWNzLmR0cw0KPiBbIC4uLiBdDQo+DQo+PiArJnVzYm90
ZzEgew0KPj4gKwl2YnVzLXN1cHBseSA9IDwmdmJ1czE+Ow0KPj4gK307DQo+IFNpbmNlIHRoZSBi
YXNlIFNvTSBkZXZpY2UgdHJlZSBzZXRzIGRyX21vZGUgdG8gcGVyaXBoZXJhbCwgYW5kIHRoZSBj
YXJyaWVyDQo+IGJvYXJkIGRvZXMgbm90IG92ZXJyaWRlIGl0IHRvIGhvc3Qgb3Igb3RnLCB3aWxs
IHRoaXMgY29udHJvbGxlciByZW1haW4gaW4NCj4gcGVyaXBoZXJhbCBtb2RlPw0KVGhlcmUgaXMg
bm8gYXV0b21hdGljIHN3aXRjaGluZyBkdWUgdG8gbGFjayBvZiBJRCBwaW4gb24gY29ubmVjdG9y
Lg0KPg0KPiBCZWNhdXNlIHRoaXMgcG9ydCBicmVha3Mgb3V0IHRvIGEgVVNCIFR5cGUtQSBjb25u
ZWN0b3Igb24gdGhlIGV2YWx1YXRpb24ga2l0LA0KPiBsZWF2aW5nIGl0IGFzIGEgcGVyaXBoZXJh
bCBtZWFucyBpdCB3aWxsIG5vdCBkcml2ZSB0aGUgVkJVUyByZWd1bGF0b3IgdG8NCj4gcG93ZXIg
YXR0YWNoZWQgZGV2aWNlcy4NClRoYXQgaXMgb2theS4NCj4gU2hvdWxkIHRoaXMgYmUgZXhwbGlj
aXRseSBzZXQgdG8gaG9zdCBtb2RlIGhlcmUgb24NCj4gdGhlIGNhcnJpZXIgYm9hcmQ/DQpGb3Ig
dGhlIGRldmVsb3BtZW50IGtpdCAvIHZlbmRvciBCU1Agd2UgaGFkIHRvIHJlbHkgb24gcGVyaXBo
ZXJhbCBtb2RlIGR1cmluZw0KcHJvZ3JhbW1pbmcgb2YgQm9vdGxvYWRlciBhbmQgT1MgdG8gZU1N
Qy4NCg0KSXQgY2FuIGJlIGFyZ3VlZCB0aGF0IGFmdGVyIHByb2R1Y3Rpb24gb25jZSBib290bG9h
ZGVyIGlzIHByb2dyYW1tZWQgdG8gZU1NQywNCnVzZXJzIGRvIG5vdCBuZWVkIHRvIHVzZSBwZXJp
cGhlcmFsIG1vZGUgYW5kIGNhbiBkZXBsb3kgT1MgYnkgVVNCIG9yIE5ldHdvcmsuDQoNCkkgd2ls
bCBjaGFuZ2UgaXQgdG8gaG9zdCBpbiB2NS4NCg0KPg0KPiBbIC4uLiBdDQo+DQo+PiArLyogY2Vs
bHVsYXIgbW9kZW0gKi8NCj4+ICsmdXNib3RnMiB7DQo+IFsgLi4uIF0NCj4NCj4+ICsJdXNiLWRl
dmljZUAxIHsNCj4+ICsJCWNvbXBhdGlibGUgPSAidXNiMmM3YywxMjUiOw0KPj4gKwkJcmVnID0g
PDE+Ow0KPj4gKwkJcmVzZXQtZHVyYXRpb24tdXMgPSA8MTUwMDAwPjsNCj4gSXMgdGhpcyByZXNl
dC1kdXJhdGlvbi11cyBwcm9wZXJ0eSBzdXBwb3J0ZWQgYnkgYW55IHVwc3RyZWFtIGRyaXZlciBv
cg0KPiBkb2N1bWVudGVkIGluIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncz8NCj4NCj4gQmVjYXVz
ZSBpdCBhcHBlYXJzIHRvIGJlIHVucGFyc2VkIGJ5IGFueSBrZXJuZWwgZHJpdmVyLCB3aWxsIGl0
cyBpbmNsdXNpb24NCj4gY2F1c2Ugc2NoZW1hIHZhbGlkYXRpb24gd2FybmluZ3MgZHVyaW5nIHRo
ZSBiaW5kaW5nIGNoZWNrPw0KDQpUaGlzIHBhc3NlcyBtYWtlIGR0YnNfY2hlY2suDQoNCkhvd2V2
ZXIgc2luY2UgaXQgaXMgdW5kb2N1bWVudGVkIEkgd2lsbCBkcm9wIHRoZSBkZWxheSBmb3IgdjUu
DQpJdCBjYW4gYmUgcmUtYWRkZWQgd2l0aCBkcml2ZXIgc3VwcG9ydCBpZiBpdCB0dXJucyBvdXQg
dG8gYmUgcmVxdWlyZWQgYXQgYSBsYXRlciBwb2ludC4NCg0KPg0KPiBbIC4uLiBdDQo+DQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OGR4bC1zci1zb20u
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhkeGwtc3Itc29tLmR0c2kN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAwLi45M2EwZWI0
ZDdmNzcwDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4ZHhsLXNyLXNvbS5kdHNpDQo+IFsgLi4uIF0NCj4NCj4+ICsJaTJjMl9ncGlv
X3BpbnM6IHBpbmN0cmwtaTJjMi1ncGlvLWdycCB7DQo+PiArCQlmc2wscGlucyA9IDwNCj4+ICsJ
CQkvKiBpbyB3aXRoIHB1bGwtdXAgYW5kIHdlYWsgZHJpdmUgKi8NCj4+ICsJCQlJTVg4RFhMX1NQ
STFfU0NLX0xTSU9fR1BJTzNfSU8wMAkJMHgwMDAwMDAyMQ0KPj4gKwkJCS8qIGlvIHdpdGggcHVs
bC11cCwgd2VhayBkcml2ZSwgb3Blbi1kcmFpbiAqLw0KPj4gKwkJCUlNWDhEWExfU1BJMV9TRE9f
TFNJT19HUElPM19JTzAxCQkweDAyMDAwMDIxDQo+PiArCQk+Ow0KPj4gKwl9Ow0KPiBEbyB0aGVz
ZSBHUElPIHZhbHVlcyBjb25maWd1cmUgdGhlIHBhZHMgY29ycmVjdGx5IGZvciBJMkMgYnVzIHJl
Y292ZXJ5Pw0KPg0KPiBUaGUgY29tbWVudHMgbWVudGlvbiBpbyB3aXRoIHB1bGwtdXAsIGJ1dCAw
eDAwMDAwMDIxIGFuZCAweDAyMDAwMDIxIGJvdGgNCj4gbGFjayB0aGUgcHVsbC11cCBlbmFibGUg
Yml0cyBwcmVzZW50IGluIHRoZSBhY3RpdmUgSTJDIGNvbmZpZ3VyYXRpb24uDQpJbiBpLk1YOERY
TCBCaXRzIDYtNSBhcmUgcHVsbC11cC9kb3duLiBJLmUuIDB4MjAgbWVhbnMgcHVsbC11cC4NCg0K
Qml0IDAgbWVhbnMgZHJpdmUgc3RyZW5ndGggd2hlcmUgMSA9IHdlYWsuDQoNCkJpdHMgMjYtMjUg
YXJlIGZvciBvcGVuLWRyYWluLCBpLmUuIDB4MjAwMDAwMCA9IG9wZW4gZHJhaW4gSU8NCg0KU28g
cGluY29uZiBiaXRzIG1hdGNoIGNvbW1lbnRzLg0KDQo+DQo+IEFkZGl0aW9uYWxseSwgZG9lcyB1
c2luZyAweDAwMDAwMDIxIGZvciBTREEgbGVhdmUgdGhlIG9wZW4tZHJhaW4gYml0IHVuc2V0Pw0K
PiBCb3RoIGxpbmVzIGdlbmVyYWxseSBtdXN0IGJlIG9wZW4tZHJhaW4gZHVyaW5nIEkyQyBidXMg
cmVjb3ZlcnkuIElmIFNEQSBpcw0KPiBhY3RpdmVseSBkcml2ZW4gaGlnaCB2aWEgcHVzaC1wdWxs
IHdoaWxlIGEgc3R1Y2sgc2xhdmUgZGV2aWNlIHB1bGxzIHRoZSBsaW5lDQo+IGxvdywgY2FuIHRo
aXMgY2F1c2UgYW4gZWxlY3RyaWNhbCBzaG9ydCBjaXJjdWl0IG9uIHRoZSBidXM/DQppMmMgbm9k
ZSBzcGVjaWZpZXMgT1BFTl9EUkFJTiBiaXQsIHdoaWNoIG1lYW5zIGdwaW8gZHJpdmVyIHdpbGwg
YXZvaWQNCnB1c2gtcHVsbCBrZWVwaW5nIHRoZSBwaW4gYXMgaW5wdXQgd2l0aG91dCByZWx5aW5n
IG9uIHBpbmNvbmY6DQoNCiZpMmMyIHsNCsKgIMKgIHNjbC1ncGlvcyA9IDwmbHNpb19ncGlvMyAx
IChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVOX0RSQUlOKT47DQrCoCDCoCBzZGEtZ3Bpb3Mg
PSA8JmxzaW9fZ3BpbzMgMCAoR1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0K
fTsNCg0KPg0KPiBbIC4uLiBdDQo+DQo+PiArCWkyYzNfZ3Bpb19waW5zOiBwaW5jdHJsLWkyYzMt
Z3Bpby1ncnAgew0KPj4gKwkJZnNsLHBpbnMgPSA8DQo+PiArCQkJLyogaW8gd2l0aCBwdWxsLXVw
IGFuZCB3ZWFrIGRyaXZlICovDQo+PiArCQkJSU1YOERYTF9TUEkxX0NTMF9MU0lPX0dQSU8zX0lP
MDMJCTB4MDAwMDAwMjENCj4+ICsJCQkvKiBpbyB3aXRoIHB1bGwtdXAsIHdlYWsgZHJpdmUsIG9w
ZW4tZHJhaW4gKi8NCj4+ICsJCQlJTVg4RFhMX1NQSTFfU0RJX0xTSU9fR1BJTzNfSU8wMgkJMHgw
MjAwMDAyMQ0KPj4gKwkJPjsNCj4+ICsJfTsNCj4gRG9lcyB0aGUgc2FtZSBjb25maWd1cmF0aW9u
IGlzc3VlIGFwcGx5IHRvIHRoZXNlIEkyQzMgcmVjb3ZlcnkgcGlucyBhcyB3ZWxsPw0KVGhlc2Ug
YXJlIGNvcnJlY3QsIHRvby4=
