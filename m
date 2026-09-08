Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789751355C
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858731; cv=fail; b=PtNSk4Mq7XsaiLzv9maJrEOFd1c+9nFcZQ7SMpXBddRqrIftT/Z4sOOt/rNL9rY6zJGl49Of3Z8cRhkw+6R9NHNmANen+XweMxNG6Bq0Ox7pQIH0BSa78PSqd9djNmnn5cGzHfC2r3N39lipt4UtkNDgk7YrulTkW4/K2DTxiUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858731; c=relaxed/simple;
	bh=BacSsK2s1vgDGoZmG6QObL0cyBPHUbtXkFiVr3Fs3TY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vy+qDWLuMfPzwi+UcYIDJqf1zFfO4p245IyWoxyJkfTFgK2vPrQeFj7LrqJ+kO95gW2LN4lGx8VG/QLW59tenPDis/bBxg3vkvDTTJNPerdVyq6X4X9xrgC84X4l3FvEbR/IcqYTLgwO2K57QeQ2Xy1pEJ+A6VV1zYbCEoLeR7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UHitIAZT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WpBLSZOH; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UHitIAZT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WpBLSZOH"
X-UUID: 580adf3cab6511f18dc8c9802ae25ab1-20260908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=BacSsK2s1vgDGoZmG6QObL0cyBPHUbtXkFiVr3Fs3TY=;
	b=UHitIAZT7YniRPOhwAXyrglL2dHx/Yho/IVl2GJaGRvJlME701yN5GHM1CPMLJfeKl+nAgHPQZsGA495of9sBQECvbVpEKIbLGI2X6xfHrZl7vVpbqDM0cd1Nftr0e6IayCbIVRxBVWmjW2MnqPHS3y8TOoFQOi+w2DqwKCvXcI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9bd52f31-0155-4664-941a-98a239fb86bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:141246f5-53ca-45da-8c71-6b2c8e06d89b,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 580adf3cab6511f18dc8c9802ae25ab1-20260908
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <congcong.yao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1101372729; Tue, 08 Sep 2026 17:11:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 8 Sep 2026 17:11:56 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 8 Sep 2026 17:11:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ8yj2oBC/AqzK6R4ddO/dupfl4tblLiD5tChPxyz24yr9umYEHvfbyXNabQjMwE+4sAEZeTg3Jl6pef8r+NM+E2SFTRP1X+igdZACKq6T0gUfxTzTFwg0byQU5PoJbKO945JHDFMzCDRqLOI8/6JN0AqvBKDpnWN227WhNMnW2ADMUFKo9777bb8L77mNhOurjVz6pqtqCRA0MWwK96hBt4TsVt570PhTis1B7C6tfoXBa2Upbs85fnsPG5hAQtpILz87/Fij5iFLaqbe9qkvCx2E71L2zJ4QYoZIhon4Xf7nejNmZtZGY/4ofWYATJH77ASbtKOL0Yw+elxrIwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BacSsK2s1vgDGoZmG6QObL0cyBPHUbtXkFiVr3Fs3TY=;
 b=yla7xWkysbdmrgcLbI1Ky/fitlZbseq5JHNHFNP2y9cwMhl6ckL6HlGe5B3II9R+IygGpGMcZhd1ESNEd4C6QByUsS9ixo63dquO82bERGcmSJEX1kmC9P65+MQJ1Oq/s23z4xXlYjQqeI3NC2o+FB39DEgoLU/Jva7qEjGCEc32wdJkphPiimLgsplTpXr9viTe+ZY+Ssswe1VFZhRYxvQtNQRgt1G5Pz40rvXFVbHBHSdOGzPjOFBDZGb73ZWv6C8ANcVgoriPbxeMAWQrHoGyScDvwTl+V7XJVPSXXAHx6sn8qZ4LT+B9iTHjD7TYmJgUrj0JCpPvf3QwT05NLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BacSsK2s1vgDGoZmG6QObL0cyBPHUbtXkFiVr3Fs3TY=;
 b=WpBLSZOHxpcmdvsMnkinwsL4Vmv1YjGMCCA/39dulNoZW3842SOR4R+usOgIpPtUGpIf/Hur4X9dZAQ84WXH8438/tLUAf2L03nININVrO2afsizbPh8l2PPCavGLJ1SMpc738VqXABLtuzVFJIlL5CcdMvX/kEw2ATLMkVZo/s=
Received: from KL1PR03MB7826.apcprd03.prod.outlook.com (2603:1096:820:f2::11)
 by JH0PR03MB7609.apcprd03.prod.outlook.com (2603:1096:990:15::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 09:11:55 +0000
Received: from KL1PR03MB7826.apcprd03.prod.outlook.com
 ([fe80::aad3:42af:9023:583e]) by KL1PR03MB7826.apcprd03.prod.outlook.com
 ([fe80::aad3:42af:9023:583e%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:11:55 +0000
From: =?utf-8?B?Q29uZ2NvbmcgWWFvICjlp5rogarogaop?= <Congcong.Yao@mediatek.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Thread-Topic: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Thread-Index: AQHdORVSHXgf08taKU23EIk0jT2QA7a3vmIAgAyzoQA=
Date: Tue, 8 Sep 2026 09:11:54 +0000
Message-ID: <c4fbcba6e1c78e81a85ef1c855efd84c3e81336e.camel@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
	 <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
	 <20260831071353.30B151F000E9@smtp.kernel.org>
In-Reply-To: <20260831071353.30B151F000E9@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7826:EE_|JH0PR03MB7609:EE_
x-ms-office365-filtering-correlation-id: 00fcda37-d1df-4fc0-6b3c-08df0d893a69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: kQ8Xb6ZQDLGpuZpXpMRzD/cxTpVu8NNHA74j7rVLyqD2y4jX7PG9zFqy3vjqp2hYEW09ISYGbTc56PEiuxb/jiUlKg+ZJNLaNipV1eyTBPfJmLNtrSRP8veAoHtVvIva6xamH2QBX9XS7ET0SeH6rP4fWwoJ6ww5KG2Uq3l6Npcqyh7nG2rL3/bA5lHe5GNr5EQycVGK27hiueGfnBG8zO3UkoQf0xWaFD/5vFm2JpSoQiv6joiwfHl93llGeCnspjMhpj31R8O9HRy/wA5x4Cun65vYlbOECASC6nP0sGH6WtG8JeuexBb9O4o74Bx0WXwyBRCgr9LyOmMZrzEvYeasPskyz2uve97PAsWNkgMarsmLFQPMTnBz1sJicdq2RynPU9/dx0CZyVJghqlrCaybv2Kdr07+mq6Wp+zJYqYfO4287NTDXxGCU0h2r5SE4fkHZdDkNQvpjKtg/TXjC7543jUdAUXWHz8PKteaJfn7Dnwct+io85yTff1jbo4bOIDsJdJaki8YMOChl13adsAV1hzSgKSuv4aF2fkIXgScTI2ILR0d1tLu6VYkYJJ+/kJ20PCMdNw+SlyKwTvJZSSXtOZKSDVWFcW11qTTXkPDh36TNTAHsuslSwfX7TVqhPRwUVuwTUEja9vvL++CsmFg1vSXwpciICsqw+WLFmJdIUF1UAd/cacoXhaTXuNgYso2wLo9YtDi3FqPtkElG32C5/sldQ4uAiZYGml1LGY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7826.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3lmdGhpc0d6d0JyZWtUVUNScXBUVW15U053T0RoYXlSZWcxMlZRay9lZzVr?=
 =?utf-8?B?amRHOCtVWjlkU2tuSDVPZDZZMnJ3VnpJbHpyeHF5UTlBaVd0WTBGSjBSeXc5?=
 =?utf-8?B?TmVHcmlNZURQajdEcys3N09kZWNGb0kzYWJ4NUhXRmI4Um0xcFd5MlZ5bUtU?=
 =?utf-8?B?a2lvS29NUytibmVEWVRldmt6akxPT1lEOEZyM0FLL0p1VE9QRDJyajdNTkZN?=
 =?utf-8?B?bko2K3ZKekpCdDlPQ0JSV1ZsRXdrVkNlTFpmamRKYituM09mMEY4aXo1WmFa?=
 =?utf-8?B?S0UwNG9YUjd5SDdoTGM1RktlZmhlSXVQZ3VRcHpqOWlaMTBtL1p2OEtpbWVG?=
 =?utf-8?B?RllRUzFRbUhIZE5OT3E1cmtyd3JuSjRkb0RoT2ExWFdXS3VRajU3cjVHR1NH?=
 =?utf-8?B?SUF5dnZmY3A5NGlRdkgyanVIbnFQZ2RWSGNPajZoYlJCaGFBK1pMbklES3l6?=
 =?utf-8?B?aktIN0hVZmRNVlVOVHNMVnpCSXRtb1YxTG92Yld6YVhHcHpaaFcyOUZXTHRo?=
 =?utf-8?B?MEtBQkRCKy9GbCsxQ3JLdXZmcEtPd1dpT2d1RW5jemhGSG1rT2hDVWVkTmxV?=
 =?utf-8?B?eVByZDNYdXk3VkY3REMzZmMvalQ1NTJIY0JWSW5rQ3FvbG9YRWFlS2tkK0FB?=
 =?utf-8?B?b2VKcmJMQkJwU2ZyOUZyc0I3V0NIV0s1OTdwL0Q1R2Y2NlV0enRzbFUyZTNV?=
 =?utf-8?B?V1hrRFRBU2Y3aU90VTRSUm1GcnZ3cTNVUC91eElvcW9zM3lCeFlncnBZSXpC?=
 =?utf-8?B?OUVpcXRPT2J5MEdkTnFZaEdNUGxYTHNHVlFYVktLTGo1TkgyWVcwNFNhcjNY?=
 =?utf-8?B?YWllNndEQnY1NmxoTFlYOXQ4WU80cnoyZVY3aEJDWXdNbVpzZDZ4TkNKWW5w?=
 =?utf-8?B?czM5QXNJK3IrTFFTb0NLYWhhVjgzZ3BNTE1ZcVpxc2hISVVMTXZ4c1AwWHlL?=
 =?utf-8?B?SmF3OSs4U2FWV2ZEZUNHeldlbzgyWDBTSDF1VzduT3ZGUVlySVE1RWNBMStT?=
 =?utf-8?B?eW9DL2tsNzJKNUwzazJ3ZFNPbGxUS3J6d3hCUXUzV1VjMnpOYlJFTWw4bVdu?=
 =?utf-8?B?dWUrV01PZnAwSXA0eWp2TWFMeTMxRVRBdkJJSTdqb3YrVm5xdUdUWnB0ODY1?=
 =?utf-8?B?aHhUTUxiTFluRWJNdDJkUnNveUZ2bVo3dkpHU3dTT0piaTgyajJrbTM0K1pt?=
 =?utf-8?B?NkRVZ1pXcjkxc0duYmJGTWVsY2FHeFBLSEtLT0RzUFYxWUVyMnlFQlNCR2ds?=
 =?utf-8?B?MzY3SnI1RkZsTjdWTTRlSHVrOFhRaW1LdC9qQ0plc2RBVUY0TWxhejRtNCtO?=
 =?utf-8?B?czErYjJkYTB3TjV0Njl5TXFybDJORUdtVjNhYUQzWFI1bStpYUtQNFBVdzVT?=
 =?utf-8?B?d3BpdXBHUU1SWkVNam1OcTdPODRXOGJQMnh3SjNoTnpmS3lXeUl4Mk1hNEw0?=
 =?utf-8?B?KzlwalVhVUIzSEs1VVB3WjFQYUdGNmN3citXSVFzZyt5TnRPUTVKQlpFZ1Zo?=
 =?utf-8?B?aWlKWWJ3QlVuN1JxUGIwQ2cvOUh2TVQ5U3Y3NkRvbkx1Z3Y4b1FwckpVbXJ0?=
 =?utf-8?B?R29FNVRVZkdaM1BqMkxGTG8rQm5xRVhWSkxEOXlMeVNOWDIrZC9uU25FNDE3?=
 =?utf-8?B?SXp0aTNZMVpyR1RSeFJ4VE9mdnA5YjVjOXV0Z3NsTkZnd096a1hGSXJLTjVq?=
 =?utf-8?B?VWIzWkg0U0RzdEdkcnFaMzMwMGJtRkU1NWdCM3dCTFFSbno2MldibHA0bDVm?=
 =?utf-8?B?YUYzZjlPVTJraVZGV1cyZnVVV3QzbDB4UU16RG1FNVNqRHR0V2RRWTZ1NWRR?=
 =?utf-8?B?RE1tZDhHZEtiT1RlZlZEem9qU1lCV0NEa3BTWFJZUm5BSUx4S3JvSktYTGRv?=
 =?utf-8?B?aEQvL0gzZDJoeVpQanpGemQzQzRnQzIrTzJvQjZEaVNHMjV3ejJjSERwbEc1?=
 =?utf-8?B?b0k3c2V1aGxsUHVKZ1pkWk5peERWYzdxVmJwekpGdnl1cTFKSk5jTk5nTXFG?=
 =?utf-8?B?ekUrdStsWDU1UUdmMlNvaUE3VFBrWGtUUTFybHQ3Tkd2dk9jbkZhYXhZTCtk?=
 =?utf-8?B?bGFkYWdNdzdIeUVjQVFpdUdFU25LTEtXVlloTHhxdmJkcGozUVZIdGtOQkxu?=
 =?utf-8?B?UFE2NnJoVjNEV1RnSEtwZiswZ045ZHQvQ3FlUzRxVTg0c3ZEOUx6MWZrSXBW?=
 =?utf-8?B?U1lkNHUycUMvdjllWlcxMFFrR0J4Smg3WWI2ZjdDdVBrbEV1c2lYQTduNXhQ?=
 =?utf-8?B?V0JiNjg4dlhtR1JyVVZLTWY1QzIzVjVTYXNNSG9FU2ttcTNISFpPTHhYUG01?=
 =?utf-8?B?Z2ZZSERKVmdEbU5xdkxRQ0lEWkFoR1U3YW9heGJaakpvdHRnbzdEdHRFVHRy?=
 =?utf-8?Q?yfkEYUzSuiAnd+7Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A3643301D13814998D0603E01A735FE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qBk81EfCbiUAnofhNPpFYA3rUPlSjn18zpehmRF6Pt3KOlsN6KTnqKNx2Y2BzTs27xRn4fD204uicoXAqXPLK+kVV0o70zjNZSkO11brTmyJ9lKTuQkM1EgPg+iG4fxa83pwDSn933Kdr2ZB3CTwjLAiNOLl9L2F0ge8CyEwcxMVwm5ecUxlklUOgHhZlDU7rC3qCQ8W8zzY6m0Gz2N6dR4B+dOUhgetffI77JBONlFqN5u6x2Z65UwV/EMMOviZeIIcAnuMgkX8DX4NZ37BA1nCaMGlbKuaidUoS3k5spJNzryiufQI4SjiOCdroOD1iaWxTtWSxHNVraYAU9l7DQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7826.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fcda37-d1df-4fc0-6b3c-08df0d893a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 09:11:55.1081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pB4ltM1nXzydRFfaoaYctKJ19QmVPGcKJwZJYPwR9q6WB7fgQbL8YsVVIqo1+C3yfgjIEH5qr/1fMQ4ceeTZmg8Wk2shw+2SAjlxYzanpMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7609
X-MTK: N

T24gTW9uLCAyMDI2LTA4LTMxIGF0IDA3OjEzICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJl
dmlldyBmb3VuZCAxIHBvdGVudGlhbA0KPiBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gDQo+IFBy
ZS1leGlzdGluZyBpc3N1ZXM6DQo+IC0gW0hpZ2hdIE91dC1vZi1ib3VuZHMgYXJyYXkgcmVhZCBp
bg0KPiBtdGtfc21pX2xhcmJfY29uZmlnX3BvcnRfZ2VuMl9nZW5lcmFsKCkgd2hlbiBhY2Nlc3Np
bmcNCj4gbXRrX3NtaV9sYXJiX210ODE4OV9vc3RkLg0KPiAtLQ0KPiANCj4gY29tbWl0IDc5OWU2
NWI2YTg4ODQwNzQxZjhkZTczMTlmMGI1NDRlMGU0MWUzZGUNCj4gQXV0aG9yOiBaaGVuZ25hbiBD
aGVuIDx6aGVuZ25hbi5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gDQo+IG1lbW9yeTogbXRrLXNtaTog
QWRkIE1UODE4OSBzdXBwb3J0DQo+IMKgwqDCoCANCj4gQWRkIHRoZSBNVDgxODkgU01JIGNvbW1v
biwgc3ViLWNvbW1vbiBhbmQgTEFSQiBwbGF0Zm9ybSBkYXRhLg0KPiDCoMKgwqAgDQo+IEVuYWJs
ZSB0aGUgR0FMUyBjbG9jayBmb3IgdGhlIE1UODE4OSBTTUkgc3ViLWNvbW1vbi4NCj4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L210ay1zbWkuYyBiL2RyaXZlcnMvbWVtb3J5L210
ay1zbWkuYw0KPiA+IGluZGV4IGFhZWJhOGFiMjExZTkuLjhjNDYwNmNiZDczZDkgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZW1v
cnkvbXRrLXNtaS5jDQo+ID4gQEAgLTQwMSw2ICs0MDEsMzAgQEAgc3RhdGljIGNvbnN0IHU4DQo+
ID4gbXRrX3NtaV9sYXJiX210ODE4OF9vc3RkW11bU01JX0xBUkJfUE9SVF9OUl9NQVhdID0gew0K
PiA+IMKgCVsyNV0gPSB7MHgwMX0sDQo+ID4gwqB9Ow0KPiA+IMKgDQo+ID4gK3N0YXRpYyBjb25z
dCB1OCBtdGtfc21pX2xhcmJfbXQ4MTg5X29zdGRbXVtTTUlfTEFSQl9QT1JUX05SX01BWF0gPQ0K
PiA+IHsNCj4gPiArCVswXSA9IHsweDgsIDB4MjAsIDB4MjAsIDB4MjAsIDB4MjAsIDB4MjAsIDB4
MTAsfSwNCj4gPiArCVsxXSA9IHsweDgsIDB4MjAsIDB4MjAsIDB4MjAsIDB4MjAsIDB4MjAsIDB4
MTAsfSwNCj4gPiArCVsyXSA9IHsweDcsIDB4NywgMHg0LCAweDQsIDB4MSwgMHgxLCAweDIsIDB4
MiwgMHg3LCAweDcsfSwNCj4gPiArCVs0XSA9IHsweDJmLCAweDFlLCAweDksIDB4MSwgMHgxLCAw
eDEsIDB4MSwgMHgyLCAweDIsIDB4NSwNCj4gPiAweDEsIDB4MTcsfSwNCj4gPiArCVs3XSA9IHsw
eDIwLCAweDIsIDB4MSwgMHgxLCAweDEsIDB4NCwgMHgyLCAweDEsIDB4MSwgMHgyLA0KPiA+IDB4
MywgMHgyLA0KPiA+ICsJwqDCoMKgwqDCoMKgIDB4YSwgMHhmLCAweDQsIDB4NiwgMHg1LCAweDEs
fSwNCj4gPiArCVs5XSA9IHsweDYsIDB4MywgMHhjLCAweDYsIDB4MSwgMHg0LCAweDMsIDB4MSwg
MHgyLCAweDQsDQo+ID4gMHg1LCAweDIsDQo+ID4gKwnCoMKgwqDCoMKgwqAgMHg0LCAweDIsIDB4
MywgMHhiLCAweDEsIDB4NCwgMHgxLCAweDEsIDB4MSwgMHgxLA0KPiA+IDB4MSwgMHgxLA0KPiA+
ICsJwqDCoMKgwqDCoMKgIDB4MSwgMHgxLH0sDQo+ID4gKwlbMTFdID0gezB4MSwgMHgxLCAweDEs
IDB4MSwgMHgxLCAweDEsIDB4MSwgMHgxLCAweDEsIDB4MSwNCj4gPiAweDEsIDB4MSwNCj4gPiAr
CQkweDEsIDB4MSwgMHgxLCAweGIsIDB4MSwgMHg0LCAweDYsIDB4NSwgMHg2LCAweDEsDQo+ID4g
MHg1LCAweDIsDQo+ID4gKwkJMHg5LCAweDUsfSwNCj4gPiArCVsxM10gPSB7MHgyLCAweDgsIDB4
OCwgMHg4LCAweDQsIDB4NCwgMHg0LCAweDQsIDB4NCwgMHhlLA0KPiA+IDB4NCwgMHgxLA0KPiA+
ICsJCTB4NiwgMHg2LCAweDIsfSwNCj4gPiArCVsxNF0gPSB7MHgxLCAweDEsIDB4MSwgMHgyMCwg
MHhlLCAweDQsIDB4OCwgMHg4LCAweDYsDQo+ID4gMHg0LH0sDQo+ID4gKwlbMTZdID0gezB4MWUs
IDB4YywgMHgyLCAweDgsIDB4ZSwgMHgyLCAweDFlLCAweDEwLCAweDQsDQo+ID4gMHgyLCAweDIs
IDB4MiwNCj4gPiArCQkweDIsIDB4MiwgMHg0LCAweDIsIDB4NCx9LA0KPiA+ICsJWzE3XSA9IHsw
eDFlLCAweGMsIDB4MiwgMHg4LCAweGUsIDB4MiwgMHgxZSwgMHgxMCwgMHg0LA0KPiA+IDB4Miwg
MHgyLCAweDIsDQo+ID4gKwkJMHgyLCAweDIsIDB4NCwgMHgyLCAweDQsfSwNCj4gPiArCVsxOV0g
PSB7MHgyLCAweDEsIDB4MywgMHgxLH0sDQo+ID4gKwlbMjBdID0gezB4NywgMHg3LCAweDMsIDB4
MywgMHgxLCAweDEsfSwNCj4gPiArfTsNCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBp
cyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNvdWxkIHRoaXMgYXJyYXkgc2l6aW5nIGxlYWQg
dG8gYW4NCj4gb3V0LW9mLWJvdW5kcyByZWFkIGFuZCBoYXJkd2FyZSBjb3JydXB0aW9uPw0KPiAN
Cj4gU2luY2UgdGhlIGFycmF5IGlzIGltcGxpY2l0bHkgc2l6ZWQgdG8gMjEgZWxlbWVudHMsIHdo
YXQgaGFwcGVucyBpZg0KPiBhbiBNVDgxODkNCj4gZGV2aWNlIHRyZWUgc3VwcGxpZXMgYSBMQVJC
IElEIGdyZWF0ZXIgdGhhbiAyMD8gDQo+IA0KPiBUaGUgZHJpdmVyIGFwcGVhcnMgdG8gYm91bmQt
Y2hlY2sgbGFyYmlkIGFnYWluc3QgTVRLX0xBUkJfTlJfTUFYICgzMikNCj4gZHVyaW5nIHByb2Jl
LCB3aGljaCBhbGxvd3MgYW4gSUQgdXAgdG8gMzEuIElmIGxhcmJpZCBpcyBiZXR3ZWVuIDIxDQo+
IGFuZCAzMSwNCj4gdGhlIHByZS1leGlzdGluZyBhcnJheSBhY2Nlc3MgaW4NCj4gbXRrX3NtaV9s
YXJiX2NvbmZpZ19wb3J0X2dlbjJfZ2VuZXJhbCgpOg0KPiANCj4gwqDCoMKgIGNvbnN0IHU4ICps
YXJib3N0ZCA9IGxhcmItPmxhcmJfZ2VuLT5vc3RkID8gbGFyYi0+bGFyYl9nZW4tDQo+ID5vc3Rk
W2xhcmItPmxhcmJpZF0gOiBOVUxMOw0KPiANCj4gd291bGQgcmVhZCBvdXQtb2YtYm91bmRzLiBU
aGlzIGdhcmJhZ2UgcG9pbnRlciB3b3VsZCB0aGVuIGJlDQo+IGRlcmVmZXJlbmNlZCBhbmQNCj4g
d3JpdHRlbiB0byB0aGUgaGFyZHdhcmUgcmVnaXN0ZXJzIGxhdGVyIGluIHRoZSBzYW1lIGZ1bmN0
aW9uOg0KPiANCj4gwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBTTUlfTEFSQl9QT1JUX05SX01BWCAm
JiBsYXJib3N0ZCAmJg0KPiAhIWxhcmJvc3RkW2ldOyBpKyspDQo+IMKgwqDCoMKgwqDCoMKgIHdy
aXRlbF9yZWxheGVkKGxhcmJvc3RkW2ldLCBsYXJiLT5iYXNlICsNCj4gU01JX0xBUkJfT1NURExf
UE9SVHgoaSkpOw0KPiANCj4gRG9lcyBtdGtfc21pX2xhcmJfbXQ4MTg5X29zdGQgbmVlZCBhbiBl
eHBsaWNpdCBzaXplIG9mDQo+IFtNVEtfTEFSQl9OUl9NQVhdDQo+IHRvIHByZXZlbnQgdGhpcz8N
Cj4gDQoNCiAgRm9yIE1UODE4OSwgdGhlIHZhbGlkIExBUkIgSURzIGFyZSBmaXhlZCBieSB0aGUg
U29DIGRlc2lnbiwgYW5kIHRoZQ0KRFRTIGlzIGV4cGVjdGVkIHRvIGRlc2NyaWJlIG9ubHkgdGhv
c2UgdmFsaWQgTEFSQiBJRHMuIFRoZXJlZm9yZSBsYXJiaWQNCnZhbHVlcyBvdXRzaWRlIHRoZSBN
VDgxODkgT1NURCB0YWJsZSBzaG91bGQgbm90IG9jY3VyIHdpdGggYSBjb3JyZWN0DQpkZXZpY2Ug
dHJlZS4NCg0KQlINCkNvbmdjb25nIFlhbw0K
