Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472397;
	b=tQ69B4+FuPjtbbIEwYlQmEHs+xnpK7yqg9xLu3Z8lAHS9CfgA/f3A9HuqUFoe9nlYhMj
	 QbjlMcAkhtYANiSSfBfY2cobttAHIEEfdiiwPp6h3nI/urrW2B1AmNaTrGu1zHo5kYGJ6
	 fv67gDLFzfe48nRIT3o3nrwz6ZuKbT0VJDDv1FocGicHVyFLACoJrI7ZoaQPYTzhj4YYr
	 k2Ld810OH/iO8TpCszSbMZggUgTNj3//4Aw+Y6fnWY9j1UoF+LEi+bkjOcL/y8sksOrQM
	 TNZYSbbWLqwHhvEQsaq5Ry7kQLbfbpRQpa9qeiIbT+xkbsJpebrn+J5aqCqMB1PZF8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jgj5v6tMzxErMpwZgPi5ZAqijUNK0DqXXXB9ZItT6e0=;
	b=kuBPOvST250FnzcMSK/hLFAXZvJx3JgwL3Rxgx96uJHL03qz6BJ3dTYXYGPIuv5kYABv
	 Fz75JxGa4UMhEDKzoPhkq6DPKdN0pNYugyZYTNNRK2WwSliVwirpV90VctlCfLB4KBWUx
	 RckW9LnRHNmhKGoYzgVTKML52Y0hJM/IeDNSlADrfrYesVrMucDbjUZ1anEG7pDhpotyA
	 Dnz11RfTtlAiLGjIMAQuKJvvpnnkk5By4i/oteXY0ByDc0nZFf7R0SyHvzPUO0WQKkLkv
	 vkuToicYeksRZWwjLrgr171d6x4wahdknc4vf6jRNgQ3D05w6OEnQWksYUqhEtQkl3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=jqi7Pxxu;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pSWPg89c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2060A6F73;
	Thu, 12 Nov 2026 08:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE2060A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=jqi7Pxxu;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pSWPg89c
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7N4R22098013;
	Thu, 12 Nov 2026 02:33:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Jgj5v6tMzxErMpwZgPi5ZAqijUNK0DqXXXB9ZItT6
	e0=; b=jqi7PxxutL7RcSXrxfhjnhe3ckXg33oCiS1FVyLBzL8dnwWh6ci9zuaOC
	0A0QXlMbjiu/M6TKT47JoLzqzj2MRIwCZZf0+sOZ9K6LOTcoXECtH/Z7GuDCZOVi
	Cdv47961vjUq2l9Q7EmEPtnt9JQGSQhVJ+fxVNpXTxjXoVbRMkqnfbixvcNXdPOu
	ablR1iztIwQvFnYB0H2enX/EvLNyy0/e7EtmrzlHUfI95MREVaQY+WPQYCd9VHiZ
	wGtwuIP1R9Z4/A3YR75apFopwVLY2x/MZImJcGgyQBOLYlusW+DaZlqcxBPd+p6i
	Se5SKuWvJa9T3NguJ31xcyo0hTfiw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hw915gcax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:33:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiS81e5soLP7+XepdpqXbfFcMc2Tjm4YGwDgs+3wHe1nIDhHE2th+RNB2//tPljgI5zrE+9pco5ADR56F7tl+eqLV/ugglZUuUWL7EGgkNfn+ymU2zeeXYj2ETuGVNtf7fiVdg7CjagF3R6MzpULrNQf6k+p1EbNGXsMP6eh4+eCuVQImIK5pVBlPZWnzcTK1ZqAbKpy83OWaoquilp2ccLfhUe1o71/R0SHRT43fS2OIR9plAjgCfkthVvTT7QbT9U2o51S5W51LWEGa+eduNauF5vxGxOUQxDN/jF7OIu1tqV5uw5sGwyOeoI1AYuh2jXVhgh8U8QUgb7wLkqibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jgj5v6tMzxErMpwZgPi5ZAqijUNK0DqXXXB9ZItT6e0=;
 b=k2FUwBxCWAJwBjpV3/R2bqhTTxAAzgkwqLLrhlQe0PU+CMgkqsuotKguqLlcfcb9oEMKOuJAxCgA91o4Mu8xVD0ATB0WOv3zrbf5EP26hsJ91dgmg5y5MJk871wk/g3VHXf495uCXh9SeugdX2krRlL9+OK4BnQkTZRRQZw3fGgi/ho8JOMhJ2cKbB3m/TWJhAetKIG8cmwBJp9xCCY68bkjjKyqAvjDhhdvUBn2nji/sGqLpRr5k1RW7xL89zQffgyL6A82Bh+1TT80ZQP5HY0xcSTRZb7y/6LgbTHcUpKfXH9C5RMpi3cyQ/3LrJlIm0bvrEPdrNSVPX9JTVK/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jgj5v6tMzxErMpwZgPi5ZAqijUNK0DqXXXB9ZItT6e0=;
 b=pSWPg89cINXf1XhnkQtYJ+Fu0bjRJ9bXJ6Ylt9tN8228SEGOCZEBsC857ZDSoWTkoVHsd8SzDbbW6mNiVHj9OUUDIEZw0Yn0ayVwPi7KIarOoiiW4GyucyUBeDbyISTzXm/n32Vk35V75CYVVfIVtwY9c0eqLiEr8Gs+7uHa2LE=
Received: from BN9PR03CA0204.namprd03.prod.outlook.com (2603:10b6:408:f9::29)
 by PH7PR10MB7850.namprd10.prod.outlook.com (2603:10b6:510:30c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 08:33:09 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::ad) by BN9PR03CA0204.outlook.office365.com
 (2603:10b6:408:f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:33:08 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:32:59 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:32:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:32:59 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8WvQh1485912;
	Thu, 12 Nov 2026 02:32:57 -0600
Message-ID: <a7959800-b60c-4f44-84eb-552c37dba376@ti.com>
Date: Thu, 12 Nov 2026 14:02:56 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] soc: ti: k3-socinfo: Export SoC registration
 helper
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
References: <20261112081047.1550471-1-m-shah@ti.com>
 <20261112081047.1550471-4-m-shah@ti.com> <sashiko-outbox-210688@kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <sashiko-outbox-210688@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|PH7PR10MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dbb126-f006-486a-d1b3-08df409794c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|4143699003|260925021311599003|260925021911599003|260925022911599003|56012099006|261009223027099003|261009221227099003|261022105027099003|261026140227099003|261102130727099003|261026121527099003|261022113327099003|261028144727099003|22082099003|18002099003|13003099007|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Okbc+SCgNjw6YWi1FL4RVPkS7d9/bW/nRYHYUf6lOtXejMIiHJAgm4yRcWLYVuIvnhTNoGlj+XWEzIOciYdhdEGdpiT3RvULGxf+Uv2+xkyH6TKnLZdaWzAREmIPmeWp5TrYNNb9dmSP9zPr03vSehIPJic6Xk3km3vjktkn9qY5frv++6gGcBf7kCDafGvfX2wLQJrzzSGVLuN0TB7QeVwFWYvoC7sXm1TxX326etqjxdVhpnBb2oc85yYw2XP1JmXawppz1sAkiiZUSnlRGYDims6dBj5HLCTJmZyjkS1X+BnkqTTmcbWTUusmc1rBk/izVGLJQEfagx3MhXk+R2u7OYBhkgnjVrCqADS/GBO+dFK000fszrGks5fa4ttpdR+/SwBq+2inHDTa+33uTEKX580nNLbbzKgrPwTfSmvbJWM59AZVK5e1VWXcIJN9jChunRDYi3j1r+b81mUtSBG+eDEve0minYdpP+ichDl1qqa4xMSbtv+tpb6dUNn7AXV1tlOht6dU5HUG+pSpD2QjDAVA4vWBQPbvRIsJ59zPPwiWA2n5WMgupNirfOLuBxg1uuNgMpBEJeHsR4j3L97gy3XPjt/jUXPqlgzVXGraN64OW1Or7Lx21C0baPoWQyCIVWlhoXMXx9ewJGrQ4A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(4143699003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261009223027099003)(261009221227099003)(261022105027099003)(261026140227099003)(261102130727099003)(261026121527099003)(261022113327099003)(261028144727099003)(22082099003)(18002099003)(13003099007)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E9axym0xPHzh7ckKM6WH4o/7fd62UIE9i+r8iZr5soJBYa8C0yA8Zke6r9PtqziCuIdLtdkgGjyhN1Wj4bQfd/zMZ/Vv9Q61eXb3HRe/mp83RMu6M08vpPCS7SILcGAkpdUAmPr5FMyml3llXnEnqQiaoUm7Ax8LneTECOvPEgN/cnqvRlWsjGeMgrr2vvllP5bhvU+8/aAfCJxBgZyIEZ+WstB7QqmjrkyyyzjsqDNyMPZHRlqsuU6XdsowAPuesSPOAMuY7sJsAnXbw0t1bw0RGjMO9wMqkcuRQGdxq2/TGzMqmBT8auKmyNkh5EfJ4Vezku6RfNb92KpnTZogfjs7b7etgIcUb7eMR+Gs3r//RCIqRXTvmdA3GOiJoqSntDLmbr0K3Md9Czes7AuGd9IEr8IQWeQPGa5lL7/FUrI2/rFYbUr1WFtXFjAsKcpE
X-Exchange-RoutingPolicyChecked:
	bpdX7O1vrwSbFjWrg+NmmSrQRAI1YdFMSboymuyFC1oplBerD4goGiH7+TuPTxBwqAcNs1VRccLsnehIepei+WXDMVBGNL//m0U3Vv6fa8kIb1/8oDoGZbEDEgyT3HIQHZNco8EUVzs5nNEqdIgQEpxyfvZ8HGZhiGOGVrbP2i+l8VJR1NoLMNIUSWRukk/eWB/9s++4HE/AMI2kAED5ze63qRfhqOQHge9zbH92MGyV9bcki7BED9UNVKBYCEGIfgirM5xFX06bA1ifBfwSnBHyXxWpFA3XX01k9q20nmFhTA57k19DoFfhvz3+RlR0EtGqEqKjsfA4c/xn+tiVFg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:33:08.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dbb126-f006-486a-d1b3-08df409794c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7850
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+l7xwy5PAbT6
 a25p0EbNzN6JV0x5szMhE+51qK5CW6e2SMWROi2Xwstt32TcxdwpJ7wIGL4t7YoFMk/GGVKC2QV
 M6fEpaFuhpxHcjWOYDgibOqX46AxnIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX16GbvQdudBoU
 kdy2nApp90dW1GOO5lporJB/2Xja8v+QFHYgWcdIbmt8V9r50IM+QO3mCW3EM8LypaOgArQIrY/
 7uH0GUL67CyokgRth6MWvrihhXfaEw/jrBfVVyZsvkoPGPcN0dwypJuSgPoZmUDOHbTyeyoKedo
 PnzdJSPL9NVYUicFk6nBW9g/wido9s75X6m3wX+eonoZ3yQ4FNqN76CwJNjiQFyi2S6l9qwVM24
 Xm2RITkhKcxa/p2arJFgD2g2S/viAiulAaxZdAZlL+5085rZ6oFFzSPKC/4DuwN3XVDtykJCLsG
 6DF5IfuaiaY5XQqK8+WkdGEU0kcMpOFpdsVWzPwAOcuWG519lH6EiV/NqglhDC+zBxR8VuwMK2T
 jXjc601ZFf7abgzGD92D0jnfFOqm00uSlyiG5pJpo+TYCeOmTX4+umYzuymvUBv7pqhxfZosAfG
 zGWI1ySHrqA1S25veQA==
X-Authority-Analysis: v=2.4 cv=a8WlZkSF c=1 sm=1 tr=0 ts=6af579c8 cx=c_pps
 a=3isWwmYGSdluMw1j68YAZQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=F1xpG-LBS1Ke4qg9fq4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dHfYX1WPIfZewhwD7mFzI6j7F7vsc5DG
X-Proofpoint-ORIG-GUID: dHfYX1WPIfZewhwD7mFzI6j7F7vsc5DG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033


On 12/11/26 13:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] soc: ti: k3-socinfo: missing header for k3_socinfo_register()
>    breaks build
> --
>
> commit 50190b242a0586e1caa40c20a83d5610007110d5
> Author: Moteen Shah <m-shah@ti.com>
>
> soc: ti: k3-socinfo: Export SoC registration helper
>
> This commit splits the JTAG ID decoding and SoC device registration out of
> k3_chipinfo_probe() into an exported k3_socinfo_register() helper.
>
>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>> index e21a2cd14c811..bf0829fb1d61c 100644
>> --- a/drivers/soc/ti/k3-socinfo.c
>> +++ b/drivers/soc/ti/k3-socinfo.c
>> @@ -5,6 +5,8 @@
>>    * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
>>    */
>>   
>> +#include <linux/device.h>
>> +#include <linux/export.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/nvmem-consumer.h>
>>   #include <linux/of.h>
>> @@ -12,6 +14,7 @@
>>   #include <linux/regmap.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>> +#include <linux/soc/ti/k3-socinfo.h>
> [Severity: High]
> Was include/linux/soc/ti/k3-socinfo.h omitted from this commit?  Without
> that header declaring k3_socinfo_register(), compiling
> drivers/soc/ti/k3-socinfo.c fails with a missing header error.

Missed adding to the commit, I will send a new version for this.

Regards,
Moteen
