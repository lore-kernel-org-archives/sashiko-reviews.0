Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093020;
	b=oWbEEE8+kbmlZjNmWn/ni8EeL76e0OMGR6GBCIdmVeqt8Ez7t3cf2xW3lqqCLWNKF9qk
	 9ThQ7V8zIOG6rMsx9DO7gKLDVli3+C4XYWlg0mOOoLdj2LO0HKNNOnELmK9jnxIlvO52R
	 q4ZNnnDZwqBzgZA0rHXyBkBjN66COK6LTm6HR/LfwDMYFC4lSM0b7LWOkrqq3ud/gZj2+
	 kM56sq6GYRf9NHkQbvb9+aBA/+LAZw3CdK//xjuk9WqlBJloQlemA06dgcdI7Bar6s3/f
	 m/Qvfo+2y7EfE5OyHKT6x+CP42KmzJ+RWeH0E5ooCi+hzM62afwJ8N2Q+0WZ8YNMyHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093020;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tcJiWflNERAJKN+0b2Of1evtaXniz/O0jz+o/VDD4CM=;
	b=lPadsLWKqjZmLAeDAOrTdpK4rdBjI3K1iofpVTUMPe+ndoRaFh1RXPg5c4Owb9oNDNvf
	 eXzgrT1wAgo4d5ehrZDvuHw0HcJj2xFX+jTLlBDk2332cHvxta4kOwqVsl28kuHNmIebM
	 Dg9135/r+n9eArDF4+6Nr+i9L8aaM2Zpps3VGXUms4nMsE3udn+SbX14KqLHuQp6bL2CH
	 3Q4CaEbHxAcnBLbDBrGkawzmVIrybw2rta/aDyjFnTArABVGViwpWRwdM5Zi9I4DE/eXV
	 NGvNtNUF9Mh3jlLEJrb8ZtyoF3l+UEEuYGLV4jZLZnHnHM5JVTZV6e7WRPxNxZ62Abw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=EQBSZl6Z;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JfWb+whd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE0606A320;
	Tue, 27 Oct 2026 09:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=EQBSZl6Z;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=JfWb+whd
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69R94cnm2721552;
	Tue, 27 Oct 2026 04:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tcJiWflNERAJKN+0b2Of1evtaXniz/O0jz+o/VDD4
	CM=; b=EQBSZl6ZufN3j1TZMppEYXzKYxu21OgaeKWM9YuLtpRW1YlKlw+WXfHeu
	+ZbEA8EMj65kXWHYisbZfnGonHnjtIEf1rhRSFEaxovXssGi8vQLB2YNZm6EUwV0
	1StWC3KRsqkVChVzPQPSEsHONhoaoy7lRJTZCE5t0qcGFtyLjNNw2II3UByqePNi
	48Np5/fnZ+94mW0XvHtDWZauIheUm8uOgt1WzjklbdSJAxVeMk10rk9TUXr58To/
	ieSvBzyjo71RSYuxoQgWzmEpIxLevvF8qMzTlcaWVln+mCcsrlFJuwEAmlBM+fh0
	7ZHjp/I+U0FaQglJW3EADSpZDWZtg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hj9rqwebu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 04:23:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQFotKvx7FLPgnIkkac5Tn9cUKy0Q9AzpYIFvDQsTVlsi9sFjp87tGnVtUHCkiRNuZdEfFYb2vA9YJH1Nc9GAZ78cYKb/Qhc6Ckqgii/EzVFN0U95gKjuiuGjAOXshMzC8N2Hb8HIWijePrLdxxh76QIccqgt+x32LIHQMTyX5NGh60PboEqPCeQDA19hobG/Mfq37+u9etcNmB22MXx0qC6VReMfvOS4dlCBXr+BDqvWjc4yhYcVbLx0M/2YfJAM7dH9fXvkJcFpypuHhAJKk1BnIe0yi9tS2HZUoQey+WXoG0Y6Wq8tJit1DZHED0KTmBYfaidZLN3d4tgLzTyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcJiWflNERAJKN+0b2Of1evtaXniz/O0jz+o/VDD4CM=;
 b=daatD3FlD7qZGIcxT4OCkB2xNlVxMdmavKrAbfmMsOE23OZ1Zqek2VfwRCUUPIKZLYIHcx5u2yNUIvbdwTwzgIDKgeqCvxnhXjtyj4RjFcG1fT0y1yV1bbub5B8jCvYUe0ZNFL8xKZQVi6dn7eOQ1clUM27tzl3KeiiDzAL9WA5DI9ww0jKqISVYyISVwVG3ioMWoIPUQlJgUzvmwYUa3Lfl5NMdh/Y4oE05nOvgyYzgb6O9SnYbj5b8jU/diwFy7iXPwjg3JTbW+emC87wi5j5c1Jf/4N1XPLmUAE3AmnUz9R+mCoi1SxP1JETCVnLLQ9KjOhyivgt1nv97E+Txrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcJiWflNERAJKN+0b2Of1evtaXniz/O0jz+o/VDD4CM=;
 b=JfWb+whd1W90OWQRpXOCCPBjN1K1bo2x73MLoHOHmhD90tnwRqXhQqPE9qnCThpUiU0/jeLz8mghUGljrrOMXG/iTm7FWRr06uFRxR69H2Ys5Q2q/m8xrRPurOkejsd5eBT1/ie0bZgjpqnGCLzMtR0lsY4FpU9xooXxHAJCtss=
Received: from BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::31)
 by DS0PR10MB8078.namprd10.prod.outlook.com (2603:10b6:8:1fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:23:32 +0000
Received: from BL6PEPF0006C3DA.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::19) by BN9P221CA0011.outlook.office365.com
 (2603:10b6:408:10a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 09:23:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0006C3DA.mail.protection.outlook.com (10.167.249.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 09:23:31 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 04:23:02 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 04:23:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 27 Oct 2026 04:23:02 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69R9MxM51630035;
	Tue, 27 Oct 2026 04:22:59 -0500
Message-ID: <bebbc032-6f40-45e6-a7bb-3a8e163add44@ti.com>
Date: Tue, 27 Oct 2026 14:52:58 +0530
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
Subject: Re: [PATCH v2 3/3] soc: ti: Add TDA54 SCM configuration syscon
 support
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        "Davis, Andrew" <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        "Kumar, Udit"
	<u-kumar1@ti.com>,
        Hari Prasath Gujulan Elango <gehariprasath@ti.com>, <a-limaye@ti.com>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-4-m-shah@ti.com> <sashiko-outbox-186303@kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <sashiko-outbox-186303@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DA:EE_|DS0PR10MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff8b2b9-b266-4e93-8bd0-08df340bf78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|261026121527099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|56012099006|4143699003|5023799004|22082099003|6133799003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	KpoDm7zn+u4ad0LnevhEgqqPIXiUjzIX1z86Okco5W+njY0Xb/1eMtu+jOa430m10WznYVLn+pHqiem7thwjkNlQ1M87TvbUYrYJ6zURe1soVJTQnjFVImS9jWBTORFQPIMeXdEYhyBswxSh7nAg0bxhnoIvm29iFEwbudKpTkPjWrZ2BeFgWeQEzX30o5E0TFXDh4gCD3JenF2BZIIf4vCC0bKZ5vGbCgCYdZSQIya7v3T9QTOqTu6OC8xD7qRwywdALvVArHXysKX8e4/jy81K0oo6c/AaQ6oSy6QZdpC/hqC5iBpeePjawAxP34agisoRw1T/dltoOi7y8rejNn9a3xilZqewojevnk0RyZ0iTd+YMZr9dmX+y8fYdJzQ7y3CtIgzEwhSeQhs1ujsXr8lL7ysWMZ+q/aoE5rf2xQY4KwA5fVcTyZTR0cBGnThBvJ3DiwmFA5EnzI0MGQkKVqGHY/jEWKZ/IBE+tjnpueuqdYDBMmsN8MtU9z6jGW2BxOD/NuTwBuLGg3OV+E1ahl3uy05sIsJjWy/zVIOFosRDefQnwk9T8B9jrkFLhpSOySMqGCbFnd/wNBuhC+3T0ZcSqvTSzZYVVbyWDQOtIfHA5WyTy+ifNSHW4l4lefMGLVLo0ISX7XrY5Vs2zsKzq3a3V5rYnS+eQKh9yMiMgxkY9ApSRAbyIoj/jFrj3XATTvcTW8u/4UrjhSDy56gvA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(261026121527099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(56012099006)(4143699003)(5023799004)(22082099003)(6133799003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7M6ewnUhgpBc3f+gsEzYVxWZtw6PDJbKqPzy0Zge8zSvKl9HbKJrlGzPj9h2qrNYw3Ky2T/bjQ6y2HGjYgy8jEkuzIJdeSUhvKUqJ7oXvh/3gGEoiZFvU6zb8cfB3Fzo5NkQTNhSPlWlWX7RYVtHLZQg86C2fZcue9K2/VqVMQuQC3k7hdeAv9CqoaMCqjc3GvYmS3lNUKcT5m3x8+8DMRwZDzKaGITOfpg4siOnVhybFGG54qQcc9k0TW1i+e7Ke6Ir7rqrvPm/9RV9USZfNUhr4ArQ6tyJ3HK7PaD2EHWANcMH/g1U1t4pA5U4gvTN22oZSCjEOJIbsLTvGnzbZt7w2ADv4bCknTrfcC0YUAKfF5wFo3ZMMG2YfvBSV+cd8EasaMF0/rrWeShBWdV35gZwSOprHK7P7V6KrpG+tY/4TRnu85m0pu3I3tdfwjFL
X-Exchange-RoutingPolicyChecked:
	yK2qrRcK+F+FMCDnkXT2eLs/aalmNyaYr8Lowhcf7BuiKhb5a62xV0KXyJG+LHNTxgD+vse74KrsNjnLv3TfGhXNmt6toBxhBNPeASc2Z5ZquYB4x6onBWr1EHRkj1a7zljRGM4o/GnrywSUAXnCHnTWW/5IU6ImumLO528J1hQyIi7JEW0Oc6oJFaTUfRf88zSJtna+EalMRacMOK5Mmd/UI9+e+iQ4XatMBkOHBLJIj7ISUSdbYXQ31TPyJCkYsJOp9m/XcMWjJRP9ZKlgsEkgNboXkUFEpkqAg2yPRMdr8FRqE8QoB1GeAHweI23DL6+7l6Prlv1FDFY8rSAWoA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:23:31.1287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff8b2b9-b266-4e93-8bd0-08df340bf78e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8078
X-Authority-Analysis: v=2.4 cv=bIWDs/+Z c=1 sm=1 tr=0 ts=6ae06d98 cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=sTWhRribMSbyvwYx1LkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfXxfYBnyDYyrPk
 QgqtWwARGoLBj7xrreIXWmTBXR2z2rkI+TVwxcXERI39kUMipJ7Ee86LWGYtVblvmNrNYkGcluH
 QDokqVH5fHkmAbvTgoouROq2+e17+N0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNyBTYWx0ZWRfX1P0cZdbN88WL
 Vj5OsE5lm+5Vne+qcHUVnL7Y7x4kZkzZQYSJLruJINw+eBTOv40WU5KAmeKxxH246+7QBjY9UEc
 ZzLoRtp1WHcpAhshMW0a6TxRlxNDPtaWHmBOAaRkf0T+0e1E1Gm0Ug5Onf6HN/rd0f+vKjjZTyX
 CXl065I4byLaitCpLZXzxvGEGjYT0vIZY4V3x6hAP5OxYjEreWxt8fVqOUB11O8z7mau7syGquS
 LBC92lB95Uo+7O/b3aYl1iKDgOIbTFxFnyDrr3FK15Tgd7r7UAoWscfI2uGHnDaiL74D0oEpgVH
 E+YOlR+DiM0LVi6mDtkqzGVzc2nl1s7gvX4ZMS+N9Gc+rqFFzNPPVU+drezzR4xbJGSLm8ZvVO3
 ICOXN0TzMuH0+SnoRhnAEKp1+tPcEDrEaHgGAWXiWO+4ORpkNwZG1ZkzxkIQEa0Iug3R7aFfPx4
 Dvwh8lN+Cxizd6leTGw==
X-Proofpoint-GUID: 236uo7FKFh54SYO-8ChHqTV36VuWwaxD
X-Proofpoint-ORIG-GUID: 236uo7FKFh54SYO-8ChHqTV36VuWwaxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270037


On 27/10/26 14:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soc: ti: use-after-free on module unload in tda54_scm_conf_probe()
> --
>
> commit f2ead172cf9d7f3e5cd199e2a129679497527a10
> Author: Moteen Shah <m-shah@ti.com>
>
> soc: ti: Add TDA54 SCM configuration syscon support
>
> This commit adds the TDA54 SCM configuration driver to provide regmap/syscon
> access to the SCM register space with proxy-based register claim/unlock
> handling, and registers TDA54 SoC identification info via k3-socinfo.
>
>> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mcu-sysconf.c
>> new file mode 100644
>> index 0000000000000..3ef82e737d095
>> --- /dev/null
>> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
> [ ... ]
>> +static int tda54_scm_conf_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct tda54_scm_conf *scm;
>> +	struct regmap *regmap;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	scm = devm_kzalloc(dev, sizeof(*scm), GFP_KERNEL);
>> +	if (!scm)
>> +		return -ENOMEM;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
> [ ... ]
>> +	regmap = devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lock_offset);
>> +	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lock_offset + 4);
>> +
>> +	/*
>> +	 * There is no way to unregister a syscon regmap, so publish it only
>> +	 * once nothing else in probe can fail.
>> +	 */
>> +	ret = of_syscon_register_regmap(dev->of_node, regmap);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");
> [ ... ]
>> +static struct platform_driver tda54_scm_conf_driver = {
>> +	.probe = tda54_scm_conf_probe,
>> +	.driver = {
>> +		.name = "k3-tda54-scm-conf",
>> +		.of_match_table = tda54_scm_conf_of_match,
>> +		.suppress_bind_attrs = true,
>> +	},
>> +};
>> +
>> +module_platform_driver(tda54_scm_conf_driver);
> [Severity: High]
> Can unloading this module cause a use-after-free when consumers access the
> syscon regmap?
>
> TI_TDA54_MCU_SYSCONF is a tristate Kconfig option (defaulting to m on
> ARCH_K3), and module_platform_driver(tda54_scm_conf_driver) generates a
> module_exit callback that invokes platform_driver_unregister(). While
> .suppress_bind_attrs = true hides the sysfs bind/unbind attributes, it does
> not prevent unloading the module via rmmod or modprobe -r.
>
> In tda54_scm_conf_probe(), scm, base, and regmap are allocated with devres
> (devm_kzalloc(), devm_platform_ioremap_resource(), and devm_regmap_init()),
> and regmap is then published globally via of_syscon_register_regmap():
>
> drivers/mfd/syscon.c:of_syscon_register_regmap() {
>      ...
> 	list_for_each_entry(entry, &syscon_list, list)
> 		if (entry->np == np) {
> 			ret = -EEXIST;
> 			goto err_unlock;
> 		}
>
> 	syscon->regmap = regmap;
> 	syscon->np = np;
>
> 	/* register the regmap in syscon list */
> 	list_add_tail(&syscon->list, &syscon_list);
>      ...
> }
>
> Because of_syscon_register_regmap() permanently stores the raw regmap pointer
> on syscon_list without taking a module reference or providing an
> unregistration path, unloading the module detaches the device and runs
> devres_release_all(), freeing regmap, unmapping base, freeing scm, and
> unmapping the module text (tda54_scm_conf_reg_read() and
> tda54_scm_conf_reg_write()) while syscon_list retains the dangling regmap
> pointer.
>
> Any subsequent or existing consumer using syscon_node_to_regmap() or
> syscon_regmap_lookup_by_phandle() will dereference the freed regmap and call
> into unmapped module text, and reloading the module will fail with -EEXIST in
> of_syscon_register_regmap().
>
> Should TI_TDA54_MCU_SYSCONF be bool (using builtin_platform_driver()), or if
> it remains a module, avoid registering a module_exit callback so it cannot be
> unloaded once registered with syscon?

Ideally, the fix should be done in the core syscon framework itself to 
resolve this issue(which is out of scope for this series)
The consumers shouldn't be doing any extra handling as suggested above.

Regards,
Moteen

