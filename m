Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020132.outbound.protection.outlook.com [52.101.84.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9434351C1E
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.132
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786034211; cv=fail; b=iD6LaCGnAjxfHhB0Z+qzUgqgRcHA8N4dSrgOpsR3L2Rvd9/whJOH9SBvfdkZwa9kwHwp19DkBA7E8VcSWIySegMezQ7PfEr36CaVFcPvb2pUp+bX4hF3lsgSupts//XFf8LsnFhsmhydhV+otp0IIc+EBw7ySYYxd66QAEQN3bs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786034211; c=relaxed/simple;
	bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BHD0W1WKuVnrC3Xpz7KSyGkdPMIodpsb8ftMZ3xnNwQLx+G6EY0MDw6FB/V4+v0XLWiwHVqiT7RjwmEpNtnxD5zTGuU8Jt3BUOW0E4JZngG1qCZTd2oQ70BjRxt3E/bxuaaGTDsk4FxxAhIxIUuqSm1TZB5QKSlAIIcXowAc3LQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=QeDvSqXN; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=QeDvSqXN; arc=fail smtp.client-ip=52.101.84.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="QeDvSqXN";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="QeDvSqXN"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=shABGFx7+yhWwkyWsy5S84yTBEGpOzbK6+VFreMPIHhzh0gRKcfoOrvMIzfEAq9QcP1VrrOjPyoRqdMDLzzpBzI7Tcg6nvLMIUuCVxpyCVgrHQ9tj54umxmrw1XIVP38EyVxc7C77tO8KJPsSAVt0XPZxQ7q15WxcP6IFNqvkQJoTmDicHFQ2rarA20a1B93Vy9Swopqtr94C61dzTcLBlnvUi40QwkD3k9/KxgMT3MxilgFJfl2vWTCak1jMlNXCbATS+WamkUk7fcG2nW5Qov/DThOYxnbiFq6Zx6bu91DX9G5QYqNrrBrnVq1cu4fB80kouSuz9tk5P3APaD2Kg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
 b=sf2mJKEhUTwZLfIKzdsb3MEd2e/uNE/9ZJzoFEh2VPFIy7U+P4F43ZSdAftxDCzemFqlVYpHVN45nto/CB8fTGHAfVA4kkKk3HLOTX0d/mUzfEi+fznIYgjEcNWo9iigBQZUmz0Sw83oXFMfl06Q5a3jvs/IGGumX+aUYw48RKyztQKcphxyH8FPTL1Hvd8Qj4PIUx7UVnesacqHoqqcXRicH62e2jvoAKZxL8naIkxze28hFy78yWG20NIxP2AjL4fIcWnRjKEHIc1jXe0NdThU3p/C/6JLl2H6mo3t9WDr9zPHl0c+BBovP6LWLl9Kajdmniv3vabhbQym6ibp/g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
 b=QeDvSqXNXx+mSemnfFrDo0GDHjLIVMS1xXor9TgA/58jYw6hMwWaSkpNYL/SmtlqqBF8EJGNOXKN3WcmuhoPNn3ZAQgZTh7umpbHAlwWuQRS6A9v8iBJKREvgpnhM9/WTXTLQqCeHSuKzHF1VmrmquyknWCkAgKYeWJb1fSdl+7oo9YCaMZroJLUqSbcXwwPpC28Vo+kEdOpU2ClHaU1JApV1MW6r+F99idk4VVBxe15GSZlmT0FZX3J/HIKLXULEH/+Z2tT6HkBJ3c30oVkPd+mq4kcxLHMgMBIXeGPi45g/5glm8wI/BYalVbo3TmOq48qhylXyi+qBKTca4AdtA==
Received: from DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) by PA4PR04MB7901.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 16:36:45 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::a9) by DUZPR01CA0075.outlook.office365.com
 (2603:10a6:10:3c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 16:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 16:36:45 +0000
Received: from emails-232974-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-106.eu-west-1.compute.internal [10.20.6.106])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 48A93817DD;
	Thu,  6 Aug 2026 16:36:45 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Aug  6 16:36:38 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786034205;
 b=FCGS89VywkTEzgnzjtB9n1x62E+NtKqW8eOS+6DA0lSgQyQ+aQBIQG+qKNUyhAFeNi9Av
 CYJwqaQqXjq4+6SIOT3zC5FMcCZQleNA8IPI+4JKEbJTLKmltMGIj8D0zadv7hKbW4pmA1Y
 nhK2NyHi5fGxqzhkb3T1ce8j0ewUKaQ=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786034205; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
 b=FNIpvR4SzXTobz0ZjZO9R0ar3Ujk5U6WlPqpkIwx2u7a7Fan8OyOmp9vsNyRLn2E21vRu
 nHgTnwc/TL760AWzYgk3+ICYkKZIbry1ENpHTIVLWAuulJqwPb75XOcFCGw751uqJCMrsls
 oHWnpfBEx6F1pYA2st8yG9e8dT6JsbQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
 b=QeDvSqXNXx+mSemnfFrDo0GDHjLIVMS1xXor9TgA/58jYw6hMwWaSkpNYL/SmtlqqBF8EJGNOXKN3WcmuhoPNn3ZAQgZTh7umpbHAlwWuQRS6A9v8iBJKREvgpnhM9/WTXTLQqCeHSuKzHF1VmrmquyknWCkAgKYeWJb1fSdl+7oo9YCaMZroJLUqSbcXwwPpC28Vo+kEdOpU2ClHaU1JApV1MW6r+F99idk4VVBxe15GSZlmT0FZX3J/HIKLXULEH/+Z2tT6HkBJ3c30oVkPd+mq4kcxLHMgMBIXeGPi45g/5glm8wI/BYalVbo3TmOq48qhylXyi+qBKTca4AdtA==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AMBPR04MB142918.eurprd04.prod.outlook.com (2603:10a6:20b:78b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 16:36:36 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 16:36:36 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Topic: [PATCH v4 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Index: AQHdIA+biPZx5ErrdUuU5oPrH179s7aF4huAgAthPQA=
Date: Thu, 6 Aug 2026 16:36:36 +0000
Message-ID: <c9e10145-5049-47c4-82b0-a4730482083a@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-5-08bc459578dc@solid-run.com>
 <20260730104937.A4AE31F000E9@smtp.kernel.org>
In-Reply-To: <20260730104937.A4AE31F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|AMBPR04MB142918:EE_|DB5PEPF00014B88:EE_|PA4PR04MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbca5da-a490-4bd3-d1df-08def3d8e770
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Uh1JVvioJYzYjSseOlYlqSzDNcN7kvr4eBatXxX8WhATigDLuLP463o4LFlrxq/qvMCwlfh1rNMEulKtHHWUje/YaV7gSLnmpzDFqFtfEDguqq56KHzQnPqEwT9/eBb/0hwznUD2BjK4mEsCaLUg7SiMIf5Pu66dSe63x/aLx78/jJnRi1zBg2Sr2qn1o35l1ar9GdwdAfmyuKs/ACL62BFaGfjnLcrGtCAB9TjW3RPN0nIoFghAHxGuKtLPkH+8MYcMgYe0WfheSwCevEoilamXRomxVGTbQMDsYzSodVsuGYZaRZJhsyylyfwhMoPQ2AEH4xOqZ7169i88f8hZs+q0iGIQSl/KGKqCszlYPVcLHCoyRPk6nrauxizlwzbaTx1OGxGunW6SzkUw+nMP8Jy0IXVU67Ur7/YkuCIF3sebZJrRUXPnsfbpZRqTcfFHBLDk01dwiVBOt+IIADbleo05Rd9ORLpqVPUB72AfkauubghNofTJCMDf9TrrUqFcAwzCKzGO34lSyTZD3VfmynBI313/XivqnaAZ9khskioISubguhN0eWZ1YUhjast6WFeE362D9I4l2S3Vl/6YEl1znhQRqWQoTV3YrsoXMx8zcDK42riOKaT8ItDRQfIB0TBrhL665QAuYkBReJJCim7vsiFV389iO5mU0sBPO2Pm+fuhTnFvKmTdt4pOZpur5E+CpGkZDn9zHx74NvwsJmYAdk+uFFWW+voRZgtkoJg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DC81914FF7AF94DA80DE70DC53A776C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sTnfLHf1oWR+xkrN77ORLMgvkAuaDGkp8SGzOXvWxXzT+9vPd4F86y3xA9BMYLX/DZy34xrrPCG0SpDY/Cte6dn4i3VIwXWH4KU3JsOHUs3tM3EaRFfGtaD8vNqf0JFKJx8aD03quRUVSO4uNbMw+8cnFS/qKR+ShPigxDIVu057PWaUbgEg9VnYEQ7TXQJQSlfyWFLsAigMDLpld36Vj1eeBL+dX+E+lsKsMD6FC95dNy5ClGlwd1f0TixMp/tMv0Fmo5IAjGYI34BTxqiOx6zl94X519+qWuOQWlH9NsYWrO4qhYWvZ/0MzGRxDwelx4Mb1cq0ZbXiSTNuMMW+DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB142918
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2bb216b207f443d5822aa84430dd656a:solidrun,office365_emails,sent,inline:9b03eda212637be2199a978f5d0f80ca
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fg9hHQ6jxnerFcWSeTYKaa70aDH7mkcoIiCuKQspbd1OQUHonqbpP/SXjkhs0Y/LZ8WKbic0jj1Aoj7KkN56hHeOoMUkpgOQoCBfSwFKESOe7CxxrNIK/gp+aqhwf7hSHCI6RUWxdqx9S4pYmxe6zRf5xw/gH4sx1xKXyjlnL/L0LwOOCVGvfxhjmsX7ofkwdlS9jx8BP7LJgHWzQJ/Ht5UcrZkE6WdlicuWwcgaOehLjZQsqIgkfoggISrifIqu023BbYCKIu3OJFSkjLYPHB23RuzkbZAmSFDkSVRginjqsKg1SBk4MLrexjGDCIUpviDavIXaPKCSt0GJyw4oIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klIlKiwzyjbMnsHJcJegu+n2aNtfbAg7iwVrMDg4lbw=;
 b=tSexJwrUF9juJijc2cjfnp5+kbf+R47EAcb28Fhs3O8y9ZDRWDfYfYWlh8rKwQVEV9DaeSqJSE2Ys86nDlw9ZNHatN+uR/LWPtubkNTj445X4yCFWS8XzXGj48ateo6jNyJXccEWqOSaPyV5YhjWdJgK5wn/Eq1fXIpXdH/q5pRhWZkfwznLb3S71xow6dbzPy4hzYh7hikGF2IF0pldTRtUt1SBm0XWkoC/MzyD8sbqUuBPrZHImng9Sz+Mge9MOA6yuAXuUjiYjqXAHpmvbRQ7pyHVfGjTKJbAU64BZzRcmVEPzJJGLBXwMKgYFbJLxLyyyghVgGFGw4fsq+iDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cf80724-ad47-45c3-2485-08def3d8e22f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|35042699022|1800799024|82310400026|36860700016|23010399003|5023799004|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	bjgl7FGYPi6nf8TH70r9Ft448tUUQZHtd+ATldNN7I3jsVMNyUD7xwJ6WWDrY6mY76CP3nkzJzhIKcQWHYWEJtdf/CJcHi92oa9353a3MtGcBmnsdqwkoEwrFDgUs0s7MdPOUAA4aZaF3JqtP6kj4YcwChzfZFqYFk7tTZfrUI2canCD5ODSYBiZTjpborsT08EftI9D6FTwf2FR2YOY2e8Wjho8CHaHuNn+maowQuq6fj7WQtp1CYFadz3ToX9RDch+fEXe+iS8zhSD9OVcp2i2gSOGC4rc68NYwTDbU6RGmUyAp0ChcBznm/UD6f7fiokPKaczWR5tsGYNoHq5dsTb2hjiqjEGEPOHFqxegXSF03D7KoTuHU+E/t29V5b4ylpyVqPEQAlxzjZdX5yXBC0zSK+QjLC15UL+8nanUaP1NfQPip3FfOEV7f2/WIvP3Rc26ycPrbg/A96/Ia4LNBfyXMZUuS9DIllv2AyThI6B2C2CkqWnjPuw/emdaaD4No/zS6K5XE7lxQ3wGg9zh+ehllPip4XyukxDhYB9bUZCOwH0/O/1OsvpxcQDCaPnhp2GRxrEsJtRTqvfWOIGEHPpsPYthNBhtrcCAYPijqXEfQhVAkDJ+aN7iT9lNJo0MUA+VI7IDaXAWy+l8BqH52ENQcX0q/nxHTRFcGdWlElU90Zk8EZIq0MHCVcm08J3BhRsc+aHsh9hQ+L0hR2B3A==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(82310400026)(36860700016)(23010399003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o4d6+td2OsvTRmtHlr+NbG59+TeTIZqtp/RA/N1ap1JcQa2Wg1cI+SKYqQBwuTb6qFmBZEMHT5e9WBu1IbDFh40F4oTGZdxgjMGvTSD6NBc0TTLxWHtlq3rUsLxw4JHkJdqwpkPoNU/DlbbkGrfivaA7AqRMnhDxBtWKcP8iy04OsavbtGFHU1A87TkZCuDlqU+Jh1QREM2Hh8Rq7rR8Vhr82Do74Rrfg0ECFv4mvtJFpTQTZojlPYTV/FOrHI76+ggSiiGkFJhh++PgqUmbclgEGhneW/fMC2UOJXU5nThgxLHKUGLEOIJPHSHYlJZlsXPlYyrmcykxAnACw8bUDsJZRj4Df7X293l1nhTfQFuSJP1CLy+htrBEEG4e4Pytwf1ZcFKenzb7rcLcOn0UAjxYZaQNvCLIlXKs5NtdPZMz0QR8+Rx/zDY5j9XkJl8n
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:36:45.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbca5da-a490-4bd3-d1df-08def3d8e770
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7901

T24gNy8zMC8yNiAxMzo0OSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIFRoZSBTREhJMCBtdXggbG9n
aWNhbCBzdGF0ZSBtYXBwaW5nIGFuZCBHUElPIHBvbGFyaXR5IGFyZSBpbnZlcnRlZCByZWxhdGl2
ZSB0byB0aGUgc2hhcmVkIGRldmljZSB0cmVlIG92ZXJsYXlzLCBicmVha2luZyBib3RoIGVNTUMg
YW5kIG1pY3JvU0Qgcm91dGluZy4NCj4gLS0NCj4NCj4gLS0tIFBhdGNoIFs1XTogW1BBVENIIHY0
IDUvNV0gYXJtNjQ6IGR0czogcmVuZXNhczogYWRkIHN1cHBvcnQgZm9yIHNvbGlkcnVuIHJ6ZzJs
YyBzb20gYW5kIGhiLWlpb3QgZXZiIC0tLQ0KPiBjb21taXQgNTk4OWNkZTUyYjBiNDc5ZmIyODYz
MTE5OTQ3ZDMzMDVlN2VhMjhlYQ0KPiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1y
dW4uY29tPg0KPg0KPiBhcm02NDogZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBmb3Igc29saWRy
dW4gcnpnMmxjIHNvbSBhbmQgaGItaWlvdCBldmINCj4NCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBT
b2xpZFJ1biBSWi9HMkxDIFNvTSBvbiBIdW1taW5nYm9hcmQgSUlvVC4NCj4NCj4+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4+IGluZGV4IDUyNDJlZmY3NmVmNTQuLjc5YzA2ZGI5
YWIxMzggMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZp
bGUNCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtlZmlsZQ0KPj4gQEAg
LTE2NSw2ICsxNjUsMTUgQEAgZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQzKSArPSByOWEwN2cw
NDN1MTEtc21hcmMtZHUtYWR2NzUxMy5kdGINCj4+ICAgcjlhMDdnMDQzdTExLXNtYXJjLXBtb2Qt
ZHRicyA6PSByOWEwN2cwNDN1MTEtc21hcmMuZHRiIHI5YTA3ZzA0My1zbWFyYy1wbW9kLmR0Ym8N
Cj4+ICAgZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQzKSArPSByOWEwN2cwNDN1MTEtc21hcmMt
cG1vZC5kdGINCj4+ICAgDQo+PiArZHRiLSQoQ09ORklHX0FSQ0hfUjlBMDdHMDQ0KSArPSByOWEw
N2cwNDRjMi1odW1taW5nYm9hcmQtaWlvdC5kdGINCj4+ICtyOWEwN2cwNDRjMi1odW1taW5nYm9h
cmQtaWlvdC1lbW1jLWR0YnMgOj0gcjlhMDdnMDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QuZHRiIHJ6
ZzJsLXNyLXNvbS1lbW1jLmR0Ym8NCj4+ICtkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQpICs9
IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LWVtbWMuZHRiDQo+PiArcjlhMDdnMDQ0YzIt
aHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC1kdGJzIDo9IHI5YTA3ZzA0NGMyLWh1bW1pbmdib2Fy
ZC1paW90LmR0YiByemcybC1odW1taW5nYm9hcmQtaWlvdC1taWNyb3NkLmR0Ym8NCj4gWyAuLi4g
XQ0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMt
c3Itc29tLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmxjLXNyLXNvbS5k
dHNpDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uNTk2
MzVhYzg0MmQzNg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3J6ZzJsYy1zci1zb20uZHRzaQ0KPj4gQEAgLTAsMCArMSwzNzQgQEANCj4+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQo+PiArLyoNCj4+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi9HMkxDIFNvbGlk
cnVuIFNPTQ0KPj4gKyAqDQo+PiArICogQ29weXJpZ2h0IDIwMjMgU29saWRSdW4gTHRkLg0KPj4g
KyAqIENvcHlyaWdodCAyMDI1IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4g
KyAqLw0KPiBbIC4uLiBdDQo+DQo+PiArCXNkaGkwX211eDogbXV4LWNvbnRyb2xsZXItMCB7DQo+
PiArCQljb21wYXRpYmxlID0gImdwaW8tbXV4IjsNCj4+ICsJCSNtdXgtY29udHJvbC1jZWxscyA9
IDwwPjsNCj4+ICsJCSNtdXgtc3RhdGUtY2VsbHMgPSA8MT47DQo+PiArCQkvKg0KPj4gKwkJICog
TXV4IHN3aXRjaGVzIFNEMF9EQVRBWzAtM10sIFNEMF9DTUQgJiBTRDBfQ0xLIGJldHdlZW4NCj4+
ICsJCSAqIG9uLVNvTSBlTU1DIGFuZCBib2FyZC10by1ib2FyZCBjb25uZWN0b3IgdXNpbmcgb25l
IGdwaW86DQo+PiArCQkgKiAwID0gY29ubmVjdG9yLCAxID0gZU1NQy4NCj4+ICsJCSAqLw0KPj4g
KwkJbXV4LWdwaW9zID0gPCZwaW5jdHJsIFJaRzJMX0dQSU8oMjIsIDEpIEdQSU9fQUNUSVZFX0hJ
R0g+Ow0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IERvZXMgdGhpcyBpbnZlcnRlZCBtdXggbG9naWNh
bCBzdGF0ZSBtYXBwaW5nIGJyZWFrIHRoZSBlTU1DIGFuZCBtaWNyb1NEIHJvdXRpbmc/DQo+DQo+
IFRoZSBNYWtlZmlsZSBhcHBsaWVzIHNoYXJlZCBvdmVybGF5cyAocnpnMmwtc3Itc29tLWVtbWMu
ZHRibyBhbmQNCj4gcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtbWljcm9zZC5kdGJvKSB0byB0aGlz
IGJhc2UgRFQuDQo+DQo+IFRoZSBzaGFyZWQgZU1NQyBvdmVybGF5IGhhcmRjb2RlcyBtdXgtc3Rh
dGVzID0gPCZzZGhpMF9tdXggMD4sIGFuZCB0aGUNCj4gbWljcm9TRCBvdmVybGF5IGhhcmRjb2Rl
cyBtdXgtc3RhdGVzID0gPCZzZGhpMF9tdXggMT4uDQo+DQo+IFNpbmNlIHRoaXMgZmlsZSBkZWZp
bmVzIHRoZSBtdXggd2l0aCBHUElPX0FDVElWRV9ISUdIIGFuZCBhIGxvZ2ljYWwgbWFwcGluZw0K
PiBvZiAwID0gY29ubmVjdG9yLCAxID0gZU1NQyAod2hpY2ggaXMgaW52ZXJ0ZWQgZnJvbSB0aGUg
RzJMIGJhc2UgRFQgdGhhdCB1c2VzDQo+IEdQSU9fQUNUSVZFX0xPVyBhbmQgMCA9IGVNTUMsIDEg
PSBjb25uZWN0b3IpLCB0aGUgc2hhcmVkIG92ZXJsYXlzIHdpbGwgcmVxdWVzdA0KPiB0aGUgd3Jv
bmcgbG9naWNhbCBzdGF0ZXMuDQo+DQo+IFdpbGwgdGhpcyBjYXVzZSB0aGUgZU1NQyBvdmVybGF5
IHRvIGluY29ycmVjdGx5IHJvdXRlIFNESEkwIHRvIHRoZSBjb25uZWN0b3IsDQo+IGFuZCB0aGUg
bWljcm9TRCBvdmVybGF5IHRvIGluY29ycmVjdGx5IHJvdXRlIGl0IHRvIHRoZSBlTU1DPw0KVGhl
IHBvbGFyaXR5IG9mIHRoZSBtdXggZ3BpbyBjb250cm9sIGlzIGluIGZhY3Qgc3dhcHBlZCBiZXR3
ZWVuIFJaL0cyTA0KYW5kIFJaL0cyTEMgU29NLCBzbyB0aGlzIHdvcmtzIGV4YWN0bHkgYXMgaW50
ZW5kZWQuDQoNClRoZSBvdmVybGF5IHNoYXJlZCBieSBHMkwgYW5kIEcyTEMgU29NcyBzZWxlY3Rz
IHRoZSBtdXgsDQphbmQgdGhlIFNvTSBkdHNpIGRlc2NyaWJlcyB0aGUgbXV4Lg0K
