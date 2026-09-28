Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020136.outbound.protection.outlook.com [52.101.84.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFBA4E2F01
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.136
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611143; cv=fail; b=tbe2dbZ3i6c8PZKsHu8mm2TRNzcEjmF8RLg1qabqaRUKCtIIdknYaJQUEbHjq6Uig7OqxACei+tQWmAcFIPWpD4qWSw/beFQBjAnJrvD3t+RCeycA8Yz17ohBIGp/7m4XyhQ59faPZ1a98P6BVTeXSF06OTf9bO6DcJsXkpZ9A4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611143; c=relaxed/simple;
	bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GCP2o31Sl9/j0eXFBcyEFecP7zv3c7Ys0/EXVwH3N99LxoBCa4IHi6O8cH0/Mq4baMw6G/9gAzhNUDSk44UndCagONeHFBJh9QE4FCfeB+6N35oDcRGddMUC83wTbYlZ3rkpRwEVY1tg6IFMt4c1iaBHKBoSJQEOLZA14LgN7FE=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wHnumxwS; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wHnumxwS; arc=fail smtp.client-ip=52.101.84.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wHnumxwS";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wHnumxwS"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QBxNVVyqe4MZ1Fe4tOfsphVo1z+ZdtwKK3nTjADZ5PDEn2Udv8YFthWpvR3hmx0unQZAA9Wc0BR1jVibFLzGpRFlQcWk8SB2td78mSqGpD82YxZdNijZO5ord3TMzJC4CS6FW8U+G8qgb1knPMXtnDdCvrcneDnmXX5m2FqB1gEGdR3TOHqrCIMARV6opF8CyPRwXTIEl6VfuvJXozWqMZheKwxLHhi6/BUEIilmDXGL6sAizcHU5RqYTKDt3VkqN91p+Y4AU+uXL8anSR0cYozQ88PxVFCbWWKJTyMBn0PKirgkrIs73ZBMrmqwlEya4jad5HSgS0cueCt9/hRjlQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
 b=VHolNPuXuNvG/WrUHKFfVp0UdO/F3cAAz2dufDTl5RGFOncKHefle13SxrNvLxKEVKvC87lvaAji2O26wSFQ/wsofE3NInNxMpLhQ+wfYMITjO55w4p+V9IV4uMgfciB6vPE5v0stebG66D32QicGxqffLXcCLRUjZZCFOZchLclx7r0lDQyBKZFUV8OIm9VDinDL2+q5DpzVnn1olgknXt1SrnpD4BuDZ1e1M6IJQe3X/VRe0vNX33pvOxHPogk7eh5Oo4iWXHSTmPq/FQZCbTqhDPrL0/Y/2PUSC5XxE5Q9fVA8tfWaggeBCDTBO+0z5u4Fe8aRQvM9MEqlGk/Aw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,2,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
 b=wHnumxwSJYK7qCJ9rECgTic53ZKNSkNjVmHvw/Knne8r5Zs4YqWAU6dhr4ctmd1lLlxatcA1wOrV/cWAy3v6WJEPzhePKGQPc8WrYq5If6YOrOV+ZPIPKJmC+u5YhXJU64WpbmhrJ+OCSpVSvLJBGyNwW896+9iMmFmMH9XQFlk+3SblLuBzBYnX0gmWS6VKyIky17hCFjAz3o3aBTdddCt7vbiar0TXL/HpUw/WYtvlzjGJVZ735eZIXPTJAhSXRgWTK9XAeFRIB8dcG5a2CRDK11Cq3RpQI7EInI4NxWzg22NCqm5WNoXzSfHmwHER98Y6uyZT18ZHIotkIcNsFQ==
Received: from AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::6)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 15:58:56 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::83) by AS4PR10CA0006.outlook.office365.com
 (2603:10a6:20b:5dc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 15:58:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 15:58:55 +0000
Received: from emails-323255-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-124.eu-west-1.compute.internal [10.20.6.124])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A66127E922;
	Mon, 28 Sep 2026 15:58:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790611135;
 b=mA2GhU120u5rrkgTV2CBUl1ySmI0VxY2y5MOHyz2dOor4SCP3JDeHSqf07rzmRoohkL0/
 A+Z0ty0tvjvtziJ8ZRJqNpVO2C3KLQWTCk9Ghm0Qey+mepi9JjoXpkYDfBlkVW4LzmoyAp7
 yHff+tm/uNh792hLCvCqcF3P9RoziGA=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790611135; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
 b=XVMHa3IVd2uKSgWqSZ/7IleflEf3/8O1O+E0bhdfRQZPcWRS0pjbcDFXP6Z81zfXF3xrO
 rnlToOXN8o8LtR4+OTNyR2bErWleOd9iBJiSRoFxqPyBohGHlMvRuqswxhYkmPc/jlTUkKJ
 PBAldhRSxyaSFaOI/e5d4XqKOjLI9i4=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
 b=wHnumxwSJYK7qCJ9rECgTic53ZKNSkNjVmHvw/Knne8r5Zs4YqWAU6dhr4ctmd1lLlxatcA1wOrV/cWAy3v6WJEPzhePKGQPc8WrYq5If6YOrOV+ZPIPKJmC+u5YhXJU64WpbmhrJ+OCSpVSvLJBGyNwW896+9iMmFmMH9XQFlk+3SblLuBzBYnX0gmWS6VKyIky17hCFjAz3o3aBTdddCt7vbiar0TXL/HpUw/WYtvlzjGJVZ735eZIXPTJAhSXRgWTK9XAeFRIB8dcG5a2CRDK11Cq3RpQI7EInI4NxWzg22NCqm5WNoXzSfHmwHER98Y6uyZT18ZHIotkIcNsFQ==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by AS8PR04MB8054.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 15:58:46 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:58:45 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Thread-Topic: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
Thread-Index: AQHdT1c5zjX6e9DUV0StdEu6eeP1PbbkEv0AgAASz4A=
Date: Mon, 28 Sep 2026 15:58:45 +0000
Message-ID: <dd07019d-1edb-4049-a72c-136381a662c2@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
 <20260928145126.EE65E1F000FF@smtp.kernel.org>
In-Reply-To: <20260928145126.EE65E1F000FF@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|AS8PR04MB8054:EE_|CPH1EPF0000051D:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 877a860b-6a5e-4e78-a5d1-08df1d7966b1
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|38070700021|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 4XvH2IKGiNikDk0UnRbcevpHxVHBy/vX+2AoxN8eiXW80YUs8kQFwbmCfzmK6tzhJAGzjXWvp8ZVOuNLsmc6wfAB+PLhdgsPBGnnGvE0VAHHXEYOrBD62iilREj/+TBli9OjxsC+muL+q+Hffljm3Gw4UReBdF2VAy5B/jDI+uPU41pP9VGOGEQNX/0K7uuG+IIBAj9L58XjyBB4dWvPDhomx4HUVHHF9X+DTBfEvf0ujxe2+OGBFUpMOhvZmVmog+PvFENfPS6mGxJmGj4UoE02kFtDjxe4vtEsuJux0FWcWeJCCCINtCzLTpBmHl8aeIa5ivR1D5lQx93Je3CvpCWujm2LH5V5CcuatlOd5ZB6hc3ZWxRvNDQG1peosfTL2XjJtiSz+lFNGPc+4SWWNZfZKDlVLe4kliUTW2H+Bb2yb0uPB1XjbdoXm7aKrEK6VIyJT1hjBK+ikL2165SMieIqfmSqEK4GiJfs0n1yjzFZ5m5w/9RoORXgNvD7emZhQ9CTG5VAZzZqqDjnIso9Y7L60RGO2Bqw00sJO9a4vu0cZ1hgHVqnUKjyDgdgNYnpUX3ZW3lXGXzosHmgUrXjh5JPkL4CXUB2O/pKgStuqBDOulaywwO0uwnKmugo5Nx1rw0im3CbGKcf/k4x9NLLSGyYXD/hWeGvlijpxL3LcAcXTm5Zaz6b94Aw5DuoSA4/Kcty1MaB0Noa6wmHUOscDg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <478B772B6BB7864894BAA02184C18E8A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 cGhGGJEZz+UYi7M63bBhqAJ9MZWlYl/7jG0ABqDsn51uxdJlaysyxjQfD3MJyEEWZ+ETCvYm+YH5jtyu8Cgox5WBfOg5Pc/nCchZmI/LGm7Zx26lVWsGHdfYn+RYU7E/1jovnoszOtWX+slUzAxhYBwMS9I4tAf8jEbLTqaLcdYUeKuZSDpkbwbXSXQRuTJNaODH8/jqWnfQwUxb4UA97tGLFFpfNsRV3KIxO78pmbN2RbanvdFEYpS0aIPyqTqcqD+X/oqrh1jf4HI8TkyANtO2D+5kYP3eDZwSEP5L4wv5BmaR+7XUO+kE8nIcnfd8m9CQkHBccTW8ef560t063Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8054
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2a31572c25b54ef7a76f1ebe3dddc1c3:solidrun,office365_emails,sent,inline:ade3458db116489e4e1f8e290e25c19e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoIzl5cqKxylLS37ttHx1CydS1GG1Ao2Zd4TpmwgGUPoDMgOjqsbV50yiILS05KhWhLyfLvMphsJC3NzoiSMKhVLDB6OdWdQLYwYWu/MiNH+Dx2Bqjvzu9lKx62o5kbeVjucg5oVpTWcuoL8X4TpQ4qwOkchBbxtHV2i/b38D8xApeD1nUtBpA5/oKtAvrcHJKWyISNUnR5vL9OEUYUtWaEo5r3EmZsAlgjsVBk/gDCjMlYrrvIJosK/1NU2Fu+gu6gatmEYYX/3c0I2OU/6n3RIzjkF5oNhoqENuJQoMu3WcuM6KNfeb0a0Lp9Y3kWsN6XgCaYjfp9LsBFyx3D3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeA+D5gygTS81dpxY32I5CkJI6wP8EdduCzbsMqTdQY=;
 b=RUl4eoGMANgbVINSOGjzji7k9tkv2rxj6jiVfWW2tuf0Z3Ugqabyvb/kADFiiLsPRD3GrkVQolQpQhs40qtmGjYQf8owp0+VFQjL4+XQmKE2XZrwEdMu782fRNJ0BTLQTAWg6Z958psjruaJW/LrZBcJtKymeTvtpjrnjn0nD6k1daUGW1fNZwuFvwBl41h5knIUpLepXANFY0l5zqmG1Kz+tuOdx1kbGJaMKOZ5yto2YOKemqLinEFWoeT0C5CPQXz8PfFGDHHbwJgpLe4MLDTv9kZSobJRxFINBqyjFbZ4dzAqE82DlApKqDBDQrFEAvVZAITBiYk3/4uiLta6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ac78ab8-1f55-477d-965c-08df1d79608e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|23010399003|1800799024|376014|35042699022|10067099003|6133799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	605nTvWqLo1EGA8oMrQQXtFKjftHGFlYw7Mv+67DkAhkBJGp9+myfacKkqG+PSpzWne8zTxPKBRXa9y15kTzXlg3aBexdKPW5nJ3yd+gACtXgZ61YFuqBqSOSWfEAIHOvNEwosp88N2G/NB9ohIXxthLv5oWDp7kk+VuxyhrYgeA2j4iHLGprQtR5MZWnHAtdaFcGK8aMw1uFC0TI3oVNGuRdeJeZdvvHPjjgGGMCy0zCD0pygtCgoruBJ3dmQgf6bZV0EUIcPRVbvb9lvLUS48mYq0955WsYhX5h9L0Lh3VFjDTwxEgU2zZj+onllQkM/v8fiHg6z6BWmtsIkO9un4M2Xyd/nhGsN+7RHJzxOK50BmBHIwFfyuMLLZZdyqoHe8v3bIWfOsBU1pnnUv1iUReKrb2nW/2WHrulsiNgKJX7Ivsb0O+FeaXwgeJ3/VErb4xS1Qnvbf6S70+r9QppYOu00aljrgdZZW6f+WmppzeuaOh5xzWME9ygHE0WMLElLoupr6nJkLrB2tz7NPprvNt0Stl6v8i0PULFKX74OsUAPBjVUGGzm6+L7E9rXoF0znNZrmbQ8WkUCSkx6wKvm4gS2Burc2Eo5VdH6d8+4cBtM/E+Iz5sPvXCCknI5hofbh6lPwpgfCzDzaFugoxv+J1KF8Eb/5/WBNCLEN86Cga8wVH9bW36HNxEbyG4KmW2ayitIjbwBefSJlSM5drEA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(23010399003)(1800799024)(376014)(35042699022)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5nJJsy4XCRJ4qc+7uFN+z14jOXjWKvtI0a5GSIB6LTkL1PRYAlYcfHyuqkh34uQG86Vp47U+luj8T8bJ4Sx2OkU2acZbFM47QNbN9pEZ5oAORlGJIJJG9f08MOY0ISPLO06U4lbqlARfs0KkLwWWc6mGjAIYHnXOejo/agY46e8YgDFJtT9k7MUP0JARAaNsQMPvqgAvx+8QcRUEMxQw2V/Lvfro9hu8zvxe3A9ETS8lt9Jvlqu71Z+85jjaBEI3hG9Cgac66+6iR+90WLZeRXpF1n9NbnmuCx2TYSfVNMkrvJoQNrIv1IgLkvbngTNE6iPG9XJBkDqrzZ6W+Cj1QzQf7KC/Fv6nxRKX9Mqw8id3tr6SHEytnH9uZuRp88Dd68kotJGBlcZz2UKuvz+ffzANZyjY+ZkqGVdrHwGo0x6Ywv+2+SRVLX1aTV+ks/UC
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:58:55.9763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 877a860b-6a5e-4e78-a5d1-08df1d7966b1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

QW0gMjguMDkuMjYgdW0gMTY6NTEgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSBkdHM6IHJlZHVuZGFu
dCBkdXBsaWNhdGUgaW5jbHVkZSBvZiBoZG1pIGR0c2kNCj4gLS0NCj4NCj4gY29tbWl0IDI0MjM3
ODMyNGMzNzcxMTQxOTJjNWNhY2Q0YmVkODRhZGJmODA4ODINCj4gQXV0aG9yOiBKb3N1YSBNYXll
ciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4NCj4gYXJtNjQ6IGR0czogcmVuZXNhczogYWRkIHN1
cHBvcnQgZm9yIHNvbGlkcnVuIGhiLXJpcHBsZSB3aXRoIHJ6ZzJsIHNvbQ0KPg0KPiBUaGlzIGNv
bW1pdCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBIdW1taW5nQm9hcmQgUmlwcGxlIGJv
YXJkIHdpdGgNCj4gdGhlIFJaL0cyTCBTb00uIEl0IGNyZWF0ZXMgbmV3IGRldmljZSB0cmVlIGNv
bmZpZ3VyYXRpb25zIGFuZCBleHRyYWN0cw0KPiBjb21tb24gY29tcG9uZW50cyBsaWtlIG1pY3Jv
LUhETUkgaW50byBzaGFyZWQgaW5jbHVkZSBmaWxlcy4NCj4NCj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0bDItaHVtbWluZ2JvYXJkLXJpcHBsZS5k
dHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0bDItaHVtbWluZ2JvYXJk
LXJpcHBsZS5kdHMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAw
MDAwLi40OTNhMmI5YjUxZDI1DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0bDItaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHMNCj4+
IEBAIC0wLDAgKzEsMTcgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArLyoNCj4+ICsgKiBDb3B5cmlnaHQgMjAyNSBK
b3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4+ICsgKi8NCj4+ICsNCj4+ICsvZHRz
LXYxLzsNCj4+ICsNCj4+ICsjaW5jbHVkZSAicjlhMDdnMDQ0bDIuZHRzaSINCj4+ICsjaW5jbHVk
ZSAicnpnMmwtc3Itc29tLmR0c2kiDQo+PiArI2luY2x1ZGUgInJ6ZzJsLWh1bW1pbmdib2FyZC1y
aXBwbGUuZHRzaSINCj4+ICsjaW5jbHVkZSAicnpnMmwtaHVtbWluZ2JvYXJkLXB1bHNlLW1pY3Jv
LWhkbWkuZHRzaSINCj4gW1NldmVyaXR5OiBMb3ddDQo+IElzIHRoaXMgaW5jbHVkZSBvZiByemcy
bC1odW1taW5nYm9hcmQtcHVsc2UtbWljcm8taGRtaS5kdHNpIHJlZHVuZGFudD8NCj4NCj4gSXQg
bG9va3MgbGlrZSB0aGlzIGhkbWkgZHRzaSBpcyBhbHJlYWR5IGluY2x1ZGVkIGJ5DQo+IHJ6ZzJs
LWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzaSwgd2hpY2ggaXMgaW5jbHVkZWQganVzdCBvbmUgbGlu
ZSBhYm92ZS4NCj4gVGhpcyByZXN1bHRzIGluIHRoZSBkZXZpY2UgdHJlZSBjb21waWxlciBwYXJz
aW5nIHRoZSBzYW1lIGhkbWkgbm9kZXMNCj4gdHdpY2Ugd2hlbiBjb21waWxpbmcgcjlhMDdnMDQ0
bDItaHVtbWluZ2JvYXJkLXJpcHBsZS5kdHMuDQo+DQo+IFsgLi4uIF0NCj4NCj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLXJpcHBs
ZS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLWh1bW1pbmdib2FyZC1y
aXBwbGUuZHRzaQ0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAw
MDAuLmQ1YmQ5YjdkZTQyODINCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yemcybC1odW1taW5nYm9hcmQtcmlwcGxlLmR0c2kNCj4+IEBAIC0w
LDAgKzEsMTI1IEBADQo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKy8qDQo+PiArICogQ29weXJpZ2h0IDIwMjUgSm9zdWEg
TWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUg
InJ6ZzJsLWh1bW1pbmdib2FyZC1wdWxzZS1jb21tb24uZHRzaSINCj4+ICsjaW5jbHVkZSAicnpn
MmwtaHVtbWluZ2JvYXJkLXB1bHNlLW1pY3JvLWhkbWkuZHRzaSINCj4gW1NldmVyaXR5OiBMb3dd
DQo+IEhlcmUgaXMgdGhlIG90aGVyIGluY2x1c2lvbiBpbnNpZGUgcnpnMmwtaHVtbWluZ2JvYXJk
LXJpcHBsZS5kdHNpLiBXb3VsZA0KPiBpdCBtYWtlIHNlbnNlIHRvIGRyb3AgdGhlIGR1cGxpY2F0
ZSBpbmNsdWRlIGZyb20gdGhlIHRvcC1sZXZlbCBkdHMgZmlsZQ0KPiB0byBrZWVwIHRoZSBpbmNs
dWRlcyBvcmdhbml6ZWQ/DQo+DQpTbyBJIGFkZGVkIGEgcmVncmVzc2lvbiA6KA0Kc29ycnkgYWJv
dXQgdGhhdCwgdjkgaXMgbm90IHJlYWR5IHRvIGJlIG1lcmdlZC4NCg0KSSB3aWxsIGRyb3AgdGhl
IGR1cGxpY2F0ZSBpbmNsdWRlIGZvciB2MTAuDQoNCg==
