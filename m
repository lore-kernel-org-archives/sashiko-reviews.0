Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023076.outbound.protection.outlook.com [40.107.162.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA5E434409
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.76
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449070; cv=fail; b=gTJXhyWwJpg2DwKZPRWQEIzgEqwJH+cAz7Pc1rAJ8Ovc79mzuCb0Uec9FEmLvUdQ/Qf4DZNAVTstiLkUzICkvqu0ht4B4HcKmqZX/6rV52Cu0kjmN1lcjdxYVYBiCwigvY3iRwURbM3xi6rCH1oNKsZ4TL8XxPPMgioD4oDeKuo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449070; c=relaxed/simple;
	bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ox5Bl4V421f4A0RGNf8SifxG27EyRyv3JpE4KdwwqXBFY5tHrLZaPi4V1QRlh7xWN24OyVxD4RBp0kgFUfS+hljsXX5sV0gOBM5b79FvRYIYHWchCS42uLqoTgHvXdw+AjxFwMTZK6xNRvAMW6PyJt0PUGL5L8ZX77AehqrCDvw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=mZ3jl49V; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=mZ3jl49V; arc=fail smtp.client-ip=40.107.162.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="mZ3jl49V";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="mZ3jl49V"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rsrlR1K946TPNSBpf9u0wv5OgZeovjd59O8AKVswa4qsndz7aqOaaUUroJHWdgVIzP2vaHcppnGnFAADIwmwSX4khrGEn9mkPzO2r5/y4oshazKujevl3xBgmW4IuxU5LXdJTuktk+ptV1poi4Jlq+f6dz+vSDiV9JKIzGgF9BHF5CJu1/vUM/sQBzHRw1IQSMysqN2wlD14lfRmeu5Vl8uGB7jmzgbe+pxCnSBuQi26GTNCdu1FL0UwnTkPy/P8gxdbxQp5QPiF8ioTPw6h85kX0gfhsEfRIXurLJt/e5eSkKYsFTbXkxsvJvf6Ax/g4d8YaSnW/rdAfcPEoT/kSw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
 b=IA7INe53M8BmrH3ywJ2kMboGFCjkrMjaU+nHk00bxiKsRDXNCzi0M4tFUX7w5x9UZKTMKIZeVl9ucknfVsuwE5ef80Kt6ZoLEni4XXfEOz23OwS/wIxo0VpoLM5bOZb9bEzDh1bJHIsgR0QePwAPG5BxPnNOHRy+h5ui6NpL9KgYG05E+DcPaIcpBrPgxKl1rarbe6iBDIYSTH14pdXOKQ43sW0jWTau6DlBFskfVRh90fbJE58lPkPuJp+H3Fc9uwOEo0zSrR57NoKbvLF+ZT0fyWp9PzqvnHUDY8myCP24DylXjGhevsubkyPnS68+7NfJ1ZRpeVfrvUeGPXkCog==
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
 bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
 b=mZ3jl49VItUA2Y1MDb3yQSpplFKRrKrC/h4IRQQlq3L9uGSAUKfhNpf72sYM+JNjEg8pN/EYDH8i4kBJpNSJZjMmbBLEElMMFwPhi+PO0IG8rBFN3OuORfwQzVeG3MwfiMprycveyUdDPVtDNCN8FbouoowQrTpQ8rupkAIAXbeSFRYIL0qkIYBLok3ewGB4uZvft9XB06Pc5Rt1jz172JoB5wTLF2MXLcV1f5CyYRE5brOg6qAbZatc32wMhnigZxbTfKuOADBVghbxb/zZCKS6PDV6RnYsyLleJysGq9YbkFDgcDUWatBxZrlQ9DJwyRgHKLCFaQWYJblzkIz5Wg==
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by DU0PR04MB9672.eurprd04.prod.outlook.com (2603:10a6:10:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:51:01 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::79) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 11:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 11 Aug 2026 11:51:01 +0000
Received: from emails-3053953-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-118.eu-west-1.compute.internal [10.20.5.118])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 93CAA80476;
	Tue, 11 Aug 2026 11:51:01 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue Aug 11 11:50:55 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786449061;
 b=B9lr6JxmdFLOHMQ8wXAhAr+L0ret+FZNv/VXy7VT910JLTkAauYlRz1XRvAR7LJE2DZWk
 Dwo7cLOzRieDz1N29J80d7lZ02ztgtWsOFuFQOZJAQZclEqOnDl68xq4UIGGEVH3aeP34sQ
 MPnuNA6lmzCN8HR/jH4iTcYEebEgpc4=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786449061; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
 b=Q4vrdcrnQMafvmnQ4hU5WY+Go8iY6ILuQ4rvqHCKF6GFSSCCfLyi8AdIINTgbDe9xKwZ7
 99RvvEAddZaswEl7kQ9Bo1qUrj9CI8JkadMo3LbU6PO6FNjy6Bcf8RQvVuAtDAq69U8nGnh
 R2ZV0tp3t7wI62nU5LxWdjLNvjGXjxE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
 b=mZ3jl49VItUA2Y1MDb3yQSpplFKRrKrC/h4IRQQlq3L9uGSAUKfhNpf72sYM+JNjEg8pN/EYDH8i4kBJpNSJZjMmbBLEElMMFwPhi+PO0IG8rBFN3OuORfwQzVeG3MwfiMprycveyUdDPVtDNCN8FbouoowQrTpQ8rupkAIAXbeSFRYIL0qkIYBLok3ewGB4uZvft9XB06Pc5Rt1jz172JoB5wTLF2MXLcV1f5CyYRE5brOg6qAbZatc32wMhnigZxbTfKuOADBVghbxb/zZCKS6PDV6RnYsyLleJysGq9YbkFDgcDUWatBxZrlQ9DJwyRgHKLCFaQWYJblzkIz5Wg==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by GV1PR04MB11013.eurprd04.prod.outlook.com (2603:10a6:150:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:50:51 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:50:50 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v6 3/5] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Topic: [PATCH v6 3/5] arm64: dts: renesas: add support for solidrun
 rzg2l som and hb-iiot evb
Thread-Index: AQHdKJeL0Bj3iVZT1EehTxvjt73koraW4fGAgAHcLwA=
Date: Tue, 11 Aug 2026 11:50:50 +0000
Message-ID: <16b2b955-bef6-4d17-9ff9-2de42768b242@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
 <20260810-rzg2-sr-boards-v6-3-41faa32cdafb@solid-run.com>
 <20260810072632.3C2831F000E9@smtp.kernel.org>
In-Reply-To: <20260810072632.3C2831F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|GV1PR04MB11013:EE_|DB1PEPF000509EE:EE_|DU0PR04MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d9b562-d3e4-4b5f-6910-08def79ed107
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|10067099003|6133799003|4143699003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 YtTUic4HeJWKMoJtnsLF/cHDhr97iS/K3yJ15TiB+ApcV9R+BMqnEhA3WkOQ4moZ0CEp9cQW95+oqw+eLY0z+5+jro+SHxZrXglojwFWhVjv1RGQPzcXgJr+arDvRMJ10bSvVc3HLKH5+C/MAVGB+ZVkM9BV1JiI1jO6tSFdJB2Eg0acEQd+GDHO8112jeOIQMUPNfknfagwV31twM2m8NWP9p7gBcnxBdqrLpUvEqx8Y1oNkR7Ws8+7lJvcRm1ZS3x672sq6qnMoLNkvYNLksCB5S4c3wmbzMXpWXIwJPoYuVuXzIRblQqYw5tRMQNQsn4IMiOgG3CtkjaCaXFh/ThLokxg2KS3xocksrFMrHeDrdlT1gRpdNnBp72fZV+3QI721nJNzam6Ki933BCjBYH2JMx6JA1rbbC1/lfVlVxXu2BbnGdiP8Dc+81iqGGdGP6CjFKkiGna7DeTCmfLXq8+XZ1R68jwtzM8f4NxPyOu0mRaDXmpqk+xPIt/pXdFUiijmQ9KKCsmrkWZIj9ij2hpM+GRaN934H7rQJrCh5VSHGEu7jMa/das8glvjNI8UPLTtfvXbGH0enybucb3gTPoIyrToMGiRIOT/aVBwzqLKhzZ8YtqCaFk5NmAC4gMJmxE+eBmGXmL0fcRkZUp+QgLJTN5Qqm9016qo0mcBqUrYO8GDcJ9e74+W8fszWeNfgcaXlTRKiN/wtc0w1c72wlCMt6ViXpPV6hIfEMe/4A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD4CC54A3B900448A09E933954AC536C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 A893U4CbDobXtr/gTpKI0mhTU4RsTdWxvKP9DDlcNik2S/XG281OITe/PzjKUArwwCV3nv94yNRnOP5FRkUaXClBYE0hw/Zw9X1Sq6MdKEuP8TX4GtDCbfS0TQAE24K47W9JmJPzX+FcwTafJ4TIzApUwloDzEbutjV+mP1d8x4HW/p9I+K4MKid65Hw5gUcnC5VijMrnhH8sBeZ9NKMQjqTgqEbVUEK0RbTwLFCzcYoiEFjfw72yoQHCYuJKwl7H5cuzHizryM4pgJgUnZYKJXBeh9fpK5v/W5ZgBP+RCbcXHDiDevSPymcHwuuc0AKKb2dXKB2zQFJg7ajruNaoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11013
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c16f603e8d6c43a39667cfd1f1d1f569:solidrun,office365_emails,sent,inline:1ef585ebedff6d3472295c2c11d8d87e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJ9M6dPy3s+OiTMn4bEzJNVUmDXD15sB2EkYnYhDaNVZGnhGq9PHvQetmCJviI7ir5h2ApFrS4EfM5oD2Wu6yE+IMFewCuV24FmxpKKJp4pVX3PpvL/n5J5A9xG4jJ9TOQ/VT+lzzl7DNqGXLBr73rclJSEY4iiDDH7zVfsYdvxbm8IZ6TLbRSM3vvexbJRQbXQcG4u+xHroUTGXA5y//Oj58Z53rmnlY31wrqIhODZXdfLu8KnDhz2we5MU3M2x+ZYWTPnsCQ8FuiM9GhAnlFhjF+10cBkGFq3nDJymRHAWMKAII9sNvoXCfvR8Ax0ripLoSJnkUSxqb5q42vXlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDer9XFOWBekdKJnGTvXpE9Ogj20u9SncLhXPZe0a0c=;
 b=RBDDXdLVEMojeeXMPJASlJDcbPcS4uDQco6D6kG6JvSTH5LSZSdF8cZ80DQ3xV6c5TMRcG8vSaoc9rSQQNaTJRi3WQfvvCEv/VGCAkMrnKVPiYYUfLWGWFYTEbDASX8G3MJRR7aH5zb08c8KHLCNTkOVw4BXf29IwriXKmav0cwriTy0zBbvl4wOe4cZqkAl3t4nDY9VmmiH3rPugLnntKJM5DvaSsJ5FbHPeU19Cce+09v6iCQLMJdk2gKpl0a1fdG5yP4HtZAysztwvCKxz5tXgj8pNoEqvcUr6XlHum762PCK/4B/0G8DsyhjzugOhjIzkEyzy1clDace4O36IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5e2b2ff-8101-4b24-b23e-08def79eca87
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|35042699022|23010399003|14060799003|36860700016|22082099003|18002099003|4143699003|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	sphh9dRIHMfPrzyL1ZIuBJ06d5zEnUT25v/ep3Ht1DyMrfEAU6FdWZxXjxxwVD4SfAuNdfEXe1Hxv0Gms5kki3zgmHJmxPpk68LjnpZBOMy6D6QXbctjwDhFQcDQPkIBVT150V9e0syH5cqy+N35U57r1XjDUF3EDQUzq1uUJwjNVbAtsw1eDzRYhXpg2Bkq3j59Vst7MuJctQhT3rRbYOjMD0PKpD3vZXig9cFXGoze0bSzS+KHbsGj6FQqJdTGOUUN5J2Uz+4WbzQ8RyAVzeK+vgrHM/0EPDBXuDVvYhF29a/BqKYTvSBqg+fUDLp8T8j0hxHMEZNhfzRwXpPm6k9lrs73n0874uD6WzICUNY3MRE9LNV5Sx5y11OZO+2Lw5Hf/KNeLqvJMogJfXZIVnQVfoegT7cEKrVe5zmjq5KOwHNuLxd0ccisr40ncvAGSepleUCDfKysrJCqEAx9fkYZtdxsZ8+XqtkPaWBq1jcsbf106W4Oay6bBTzaCDUDZBloijVzeLQRZ398kdGKVEQTS2gVG63minu4o6e77vIMiNFvJURcSpdEr9YMo0kB1SAb1NhShWOubAYEEqPU8BIpUWLALoLS1WncR20ABX8OjAD5PxveDA4mIrgrJ/KYG6kCW1YvRs2mrc8KOLkzqwiaHBWUEusUSHtRqTSx5rbclgVFU4RQPjFmmlQPHK9T0jwZHYB7RTu61pqXoczn+w==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(35042699022)(23010399003)(14060799003)(36860700016)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5luttexsLsvOV9T5HYXWk3ZWyiZFCiGKagaEgoP6SOrtx/LuiKirrDbIldniZxkDtJ2FdoWBm04sknwwD+O7I2jt6pGdpf0gT3XwE//hZ6ybdQCOdIgUvJJwZYKULvlMswiPqtQWpX7i5klJBMGIkn9s7kS2mUYXmN3vQuuLL8l5dAnv+tQfaDUZGSoA0yFR8XdMG48+B5q4kd12zBSO32V/XbOxVtshpf2LqvOTrHVAPmMLWE2ZZ6PuVlORcbre50Qad2Swc8gKDzCFFHyJ8Gb0a6TA+S8DRW3ijN+PA4wzGIIezgKMiPMcpEReAkW711mqJztU+iP+DamgZuhmn/DqofzWlXwh3LftCdCvMb4/lBK91yItGE/wexj+1GRHpDaPWCp7QK01FuS+7Q9eAqhbqo+GHAXCyWEXRq/cM6Zo3FlOS6+kDLl55CZNvGnR
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:51:01.6579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d9b562-d3e4-4b5f-6910-08def79ed107
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9672

T24gMTAvMDgvMjAyNiAxMDoyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gTG9zdCBpbnRlcnJ1
cHRzIGZvciBjaGlsZCBkZXZpY2VzIGR1ZSB0byBlZGdlLXRyaWdnZXJlZCBwYXJlbnQgaW50ZXJy
dXB0IGNvbmZpZ3VyYXRpb24gb24gdGhlIEkyQyBleHBhbmRlcg0KPiAtLQ0KPg0KPiAtLS0gUGF0
Y2ggWzNdOiBbUEFUQ0ggdjYgMy81XSBhcm02NDogZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBm
b3Igc29saWRydW4gcnpnMmwgc29tIGFuZCBoYi1paW90IGV2YiAtLS0NCj4gY29tbWl0IDNmMTk1
NzYyNmYxZTFlNWFiMWU3ZGRlZGJmYjUzYzVkZWEzNzg4ZTANCj4gQXV0aG9yOiBKb3N1YSBNYXll
ciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4NCj4gYXJtNjQ6IGR0czogcmVuZXNhczogYWRkIHN1
cHBvcnQgZm9yIHNvbGlkcnVuIHJ6ZzJsIHNvbSBhbmQgaGItaWlvdCBldmINCj4NCj4gVGhpcyBj
b21taXQgYWRkcyBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciB0aGUgU29saWRSdW4gUlovRzJMIFNv
TSBvbiB0aGUNCj4gSHVtbWluZ2JvYXJkIElJb1QgY2FycmllciBib2FyZCwgaW5jbHVkaW5nIEV0
aGVybmV0LCBlTU1DLCBVU0IsIGFuZA0KPiBjb25maWd1cmFibGUgbXV4IHN0YXRlcyBmb3IgdmFy
aW91cyBpbnRlcmZhY2VzLg0KPg0KPiBMaW5rOiBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2Vt
YmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVzYXMtcnotZmFtaWx5L3J6LWcybC1zb20vDQo+IExp
bms6IGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVu
ZXNhcy1yei1mYW1pbHkvaHVtbWluZ2JvYXJkLXJ6LXNlcmllcy1zYmNzL2h1bW1pbmdib2FyZC1y
ei1nMmwtaW90LXNiYy8NCj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtY29tbW9uLmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtY29tbW9uLmR0c2kNCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAwLi5lYWVjNGNjYTc2OTQ5
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cnpnMmwtaHVtbWluZ2JvYXJkLWlpb3QtY29tbW9uLmR0c2kNCj4gWyAuLi4gXQ0KPg0KPj4gKwl0
Y2E2NDE2X3UyMTogZ3Bpb0AyMSB7DQo+PiArCQljb21wYXRpYmxlID0gInRpLHRjYWw2NDE2IjsN
Cj4+ICsJCXJlZyA9IDwweDIxPjsNCj4gWyAuLi4gXQ0KPg0KPj4gKwkJLyogTGV2ZWwgdHJpZ2dl
cmVkIGlycSBkb2VzIG5vdCBjdXJyZW50bHkgd29yayB3ZWxsIG9uIFJaL0cyTCwgZmFsbC1iYWNr
IHRvIGVkZ2UgKi8NCj4+ICsJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBpbmN0cmwgUlpHMkxf
R1BJTyg0LCAwKSBJUlFfVFlQRV9FREdFX0ZBTExJTkc+Ow0KPiBbIC4uLiBdDQo+DQo+PiArCWxp
Z2h0LXNlbnNvckA0NCB7DQo+PiArCQljb21wYXRpYmxlID0gImlzaWwsaXNsMjkwMjMiOw0KPj4g
KwkJcmVnID0gPDB4NDQ+Ow0KPj4gKwkJLyogSVJRIHNoYXJlZCBiZXR3ZWVuIGFjY2VsZXJvbWV0
ZXIsIGxpZ2h0LXNlbnNvciBhbmQgVGFtcGVyIGlucHV0IChKNTAwNykgKi8NCj4+ICsJCWludGVy
cnVwdHMtZXh0ZW5kZWQgPSA8JnRjYTY0MTZfdTIxIDcgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4+
ICsJfTsNCj4+ICsNCj4+ICsJYWNjZWxlcm9tZXRlckA1MyB7DQo+PiArCQljb21wYXRpYmxlID0g
ImFkaSxhZHhsMzQ1IjsNCj4+ICsJCXJlZyA9IDwweDUzPjsNCj4+ICsJCWludGVycnVwdHMtZXh0
ZW5kZWQgPSA8JnRjYTY0MTZfdTIxIDcgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4+ICsJCS8qIElS
USBzaGFyZWQgYmV0d2VlbiBhY2NlbGVyb21ldGVyLCBsaWdodC1zZW5zb3IgYW5kIFRhbXBlciBp
bnB1dCAoSjUwMDcpICovDQo+PiArCQlpbnRlcnJ1cHQtbmFtZXMgPSAiSU5UMSI7DQo+PiArCX07
DQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBXaWxsIHRoaXMgZWRnZS10cmlnZ2VyZWQgY29uZmln
dXJhdGlvbiBjYXVzZSBsb3N0IGludGVycnVwdHMgZm9yIHRoZSBjaGlsZA0KPiBkZXZpY2VzIHNo
YXJpbmcgdGhpcyBleHBhbmRlcj8NCj4NCj4gVGhlIHBhcmVudCBleHBhbmRlciAodGNhNjQxNl91
MjEpIGludGVycnVwdCBpcyBmb3JjZWQgdG8NCj4gSVJRX1RZUEVfRURHRV9GQUxMSU5HLiBIb3dl
dmVyLCBjaGlsZCBkZXZpY2VzIGxpa2UgdGhlIGFjY2VsZXJvbWV0ZXIgYW5kDQo+IGxpZ2h0IHNl
bnNvciBhcmUgY29uZmlndXJlZCB0byB1c2UgSVJRX1RZUEVfTEVWRUxfTE9XIG9uIHRoZSBzaGFy
ZWQgcGluIDcuDQo+DQo+IElmIG9uZSBkZXZpY2UgYXNzZXJ0cyBpdHMgaW50ZXJydXB0IChwdWxs
aW5nIHRoZSBzaGFyZWQgbGluZSBsb3cpLCB0aGUNCj4gZXhwYW5kZXIgd2lsbCB0cmlnZ2VyIGEg
ZmFsbGluZyBlZGdlIHRvIHRoZSBTb0MuIElmIHRoZSBzZWNvbmQgZGV2aWNlDQo+IGFsc28gYXNz
ZXJ0cyBpdHMgaW50ZXJydXB0IGJlZm9yZSB0aGUgZmlyc3QgaXMgY2xlYXJlZCwgdGhlIHNoYXJl
ZCBsaW5lDQo+IHJlbWFpbnMgbG93IGV2ZW4gYWZ0ZXIgdGhlIGZpcnN0IGRldmljZSBkZWFzc2Vy
dHMgaXQuDQo+DQo+IEJlY2F1c2UgdGhlIFNvQyBwYXJlbnQgaW50ZXJydXB0IGlzIHN0cmljdGx5
IGVkZ2UtdHJpZ2dlcmVkLCBubyBzZWNvbmQNCj4gZmFsbGluZyBlZGdlIGlzIGdlbmVyYXRlZCBp
biB0aGlzIHNjZW5hcmlvLiBDb3VsZCB0aGlzIGxlYXZlIHRoZSBpbnRlcnJ1cHQNCj4gbGluZSBz
dHVjayBsb3cgcGVybWFuZW50bHkgYW5kIGRyb3AgYWxsIGZ1dHVyZSBpbnRlcnJ1cHRzIGZyb20g
dGhlc2Ugc2Vuc29ycz8NCj4NCkl0IG1pZ2h0LCBpdCBtaWdodCBub3QsIGZvciBub3cgdGhpcyBp
cyB0aGUgY29tcHJvbWlzZS4NCk1heWJlIG9uZSBkYXkgcnpnMmwgcGluY3RybC9ncGlvIGRyaXZl
ciB3aWxsIGltcGxlbWVudCBsZXZlbC10cmlnZ2VyZWQgaXJxLg0KDQpJIGNvbnNpZGVyIHRoaXMg
bm90IGJsb2NraW5nLg0KDQo=
