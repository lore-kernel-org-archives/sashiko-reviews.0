Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795508569;
	b=pjIZ/d8V8yf7GQFI7ekzCwELvd83siR3ZhZLdDQz7jqslQzKPvpeoONLsFLL6tS4kR+T
	 1X5D42WEQlA7lKrZhgjzbBwqQ1xm312A2GiKnza/Hqm4e8/lB0n/QljUw1vneu2nrk/n4
	 oMKVRqQVQcfN45Y+fnZE1V71VIpI56H8G1hqt+1OmrdRsOSvzlLDO+KaQusuW1yoO8hop
	 JDjSGofH3ijTclawPB/rgyiX3SMi7qXw6SmouGU6PlyqTuWs/2ropXIh7ft+3GBygBeIY
	 /1ziap86aFt1ckr+9MRBKPmfT+le2s3ptIz25Tgvq39zqHrQUQ8u02A8arsLB64klcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508569;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tYzuUJoqTl59EhFIzQejKXYQYxp/Zru/Zr0jg3C6rtY=;
	b=ITK3oTENoOazto98sVJZqbyuzojSWiOA/cNUuoLJ7i+uFtjeppzJTO24+ZUrgD/0R6sN
	 fsy+3Ry6eTFaVA31gYwr+rg1FKM7TiYNcgcyVqZqby174RxfF//gETooGlD/i/lUHFYUf
	 VH8+yjwfLE05LUfVK7/BZ0EwS7fBB3paNSKV0pgvdFjcp+1NyhRRWSKniRvVCgnQKog8F
	 cIAeZpl49PqE+9CRh4Gn7NWsRuLpyR+dPHs2y4trKpwST47pBT8HLocDLrLU5BLBizlJf
	 ymudf24N5fd3onTC1PtXdLtK0ycQNhtaHFmTq2WZycHTK/9QUQc3q1zQpxkHunHvrMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oXFA+qc+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.45
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECEA606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECEA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oXFA+qc+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXZ4M6i7svp8va6/FwURQIjsJ1bxkyGXZgv3DlFN1iPBvWGm3YU0I+SuxjsTOFeRHpDd6udqjOiPcU8Qt43HlAG5axLOcwOk0/14iJZyDEpHAabTuYQSAhQ/5qtQoMMFx/QQkWJ5HtVQkYdxzIMbgXs2Y9yscTpm18QUx+DsGPLqhj9NDsuqfyEGtrO2hnt/toUhp0kGmbIHkJInXejHp795ANClCitYfhgJdDLorVAH4lsIEvIMnHzFmeYT4LNmfXF6aozuxn6f5PUHVDCMx78w9ACw10pOBUwvlzQwgjD0/L2dulSe3eT3yJavgVxHF2fc0kTIwAjdFfcRFnQHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYzuUJoqTl59EhFIzQejKXYQYxp/Zru/Zr0jg3C6rtY=;
 b=VeKtNIX1dYS3lqTfWo6L3vxsKgAR+nY477Vq+/n9n8BMkY0U3TjMMzf91OW5W1WTtoGLtKy6Hks1/h7H4YUY7BEnVKOkFJnj1jzV0mQ4Sx5LY5UWcrLPETRaSnE7lvx34wLkQneAwjHY1sUBdLNiVFy2p8QVUjNurcZW47eOOcrXmfLTIozLTrIjD8UWZLAijZf9NUI6i41T5MmVF4LeBTFZOMEVoGs4eHXFf/AN0lkb2ljtLpOebYkEsrX0KPwxMbMiL2M6Y13+ZMYJmBPKPG3sG/uDee1NjLG6K471o4zn/rnCjKJmrdqTVQzgt72W6ZFhxT+iptm370kvv4QPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYzuUJoqTl59EhFIzQejKXYQYxp/Zru/Zr0jg3C6rtY=;
 b=oXFA+qc+ohZkmBk/pabMEKOCRpCu9z63hrD1ewOQ1sMGrvhOGcR8/qXWjeUNMkv1POqS18jpWRfzSHjOVX0NdGZqmWZR/oO3S6OpdIbYEuwragYMSP19F1fKzWz7xxno5oWkscngklKjgzNOtOjmzYzjU2KaYH14JlasjS2Uw6g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:22:46 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:22:46 +0000
Message-ID: <3b528838-6267-470a-8282-3abcf9e4003b@amd.com>
Date: Tue, 24 Nov 2026 13:55:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 24/24] soundwire: bus: use pm_runtime_get_if_active()
 in sdw_handle_slave_alerts()
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Venkata prasad Potturu <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Poojitha.N@amd.com
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
 <20261123170520.1380924-25-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-229764@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-229764@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|DS0PR12MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7dd4ec-87ac-491f-9980-08df4a041e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|5023799004|260925021311599003|260925022911599003|260925021911599003|56012099006|4143699003|261028144727099003|261022105027099003|261022075727099003|261026121527099003|261009221727099003|261009221227099003|261102123227099003|261009223027099003|261021123027099003|261021121427099003|261009220027099003|261009223327099003|261026140227099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	bIQ/Hx+uPOjYVobY2/Xn7AeJ8SBkQ8y+K9IjUfZeRRYGMcCgApu4Ld41k6K79UL9wRj97WLpahKPafDpVXHZl7VNwcijnbiD86GxzSQ9OTwaBTYSeU1WDN8fy8IUkr34HJskxrI+X10PAIAwuDqnVS5plehmkEvUGTCtk9EL2CD36tZhHg+BgGxgdRiuYl6AH89l8Et05x5vgiH2r5/Ic+B67pfuEgkyp0aNiA9PDyIgsy5TjxbDgaVLZL0cvODjEV0fZCVJMfTjVdsvE4qMULolmd9QFtB3ob2zA6Pt0eVG3JNNpgVb9zyr30GUejDeEN+m7R6Qm+QSMpzHze5mP+DM7MMrOeg+wbuO0PuVAE7yBTRLkKjyv4LTlG1KwjXMj24J18PUOUZf61oGLINAN6VGrA5+ktnlMK1Rn2g6MmH2+i6qWmoiMiDhNYxuZS0Cw0t9VdXw3WnMTkgYc620CvNUbvfJZTs8ij/f5y9eYIIZMmjACJ6FaOjqINrbKhDMpxkeyfPZ3+s2q6Ml1p76INS/fEgDem0cooHPPyPqDuabHbP5Gb8kjF12iPvChmaqMzATxmmpYCNpm1YIuZxmDSZ8N/VXbd16Aywo4Mhf5+ItE3OAxu8sS2crmavDhX2UuzBNu5i6F6h6U73BbB39+JDsDQxtq28fRZbEuB/Mk00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(5023799004)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261022075727099003)(261026121527099003)(261009221727099003)(261009221227099003)(261102123227099003)(261009223027099003)(261021123027099003)(261021121427099003)(261009220027099003)(261009223327099003)(261026140227099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDA2ZkJBenFiVlF5YVBtMUc3MDdHektDLzJEWG42ME91cWJDYjNCQ0llSGZG?=
 =?utf-8?B?OWV4dnhPVWZBb29HR1BqVUpucjVQdzUwWVBiWmZjaGNWS2JnUG9OcDBMaENw?=
 =?utf-8?B?S095NGpkUzhKNm5CdjJLQksxWDVRbmdwWGxNVnNYcERqUG5xclRHUjFaSk03?=
 =?utf-8?B?bnFKdGw1cWtHMmlnbTNsQWUyeXFRa0xHQXJyTmM5akpzTWxYT1ViK0JjNytl?=
 =?utf-8?B?ZFk2bTRhKzVBNU01RzJZQzhXeTRxMTE5ekgzMGJjbWQ3MVk0TjRSQlY2VEky?=
 =?utf-8?B?NlNqSWEwQTdhYWVVcXJXNmtDZDNwWldPZnpTekJIYWdQWEVDaFp2WHlBSEsy?=
 =?utf-8?B?VWViR2ZRazdWcm1USFRhdDJNS0NhM1VLdGVRUThVaDRYa1NITnN0NStmVUdj?=
 =?utf-8?B?TkJlZ1Z4QVR1eTU2dDVWY0tQQXhETkQvQ0xDcmNQUkd0bnZ2K3R6dForN1VW?=
 =?utf-8?B?eXVRZFQrWW5QWFgvbUh6eXpFeDhZNUEzSFpGbm5HZmFrMFR1RVhZdzVJOTYv?=
 =?utf-8?B?YXRXSHUwd01TcFlNR2NqTWdSVHZiRWpUVnYvcllSbE4vWjhlQ0t2dnRWOUpG?=
 =?utf-8?B?dklseVl6V2piekdCWFFnbVFBdmhjWFc2ci9lMldrSkZmVGdLZmREbkpaS211?=
 =?utf-8?B?QTgxM3BzQjhSbHp0WVNoV1BYM2Jhb3pzVVF5OFZrV3hiVnFBVnFTVVhzeSty?=
 =?utf-8?B?ano3UWhIcFhrMklseE5qYjZsT3BPbzdMQ2xLS2xpRHlnVy9RLzBSRlJWR2Zv?=
 =?utf-8?B?djNRa2JDcWVKTldvejY5ZUF1NGpLNHFHMGVGdlAxVmtiRDhwOVNYczRkRmpo?=
 =?utf-8?B?bFpZOEVaZENtRUJ4S0c5eERRYVdSUklMSHlaTS9jZDdLUTAydWFONWR6ZDg1?=
 =?utf-8?B?RTBya3I0VGI3eWNYWDhpaEVrQlZNYkhGVzVCU3gvcWRGTUd1SWpqUnRpRmhU?=
 =?utf-8?B?b3ZoTVFuNThoTFlNZ25ucUY3dEl2YXlzZVJ5RUxIWmIzL3VBZkRvSWN2U2ZH?=
 =?utf-8?B?V3VIWG9HdnhjdkZ2bU5IVUxsb3FTREpvRUV3N2ZCcUVLUlpqRFpwSkdYam1N?=
 =?utf-8?B?OU4xZi9reDNad3UyWEFPcTk2VGNzdXc1Nms3SE84ODcwVmR6ckdDSmlBT01p?=
 =?utf-8?B?OGpiaWFBTnRWRTF4U1ZxanFJa0ZsV0JtSVFFU2RuZU1OUG9OVU5KZEhBbmNN?=
 =?utf-8?B?d1dleU9DQm1BcWdMTlRETSt2bkZ3TFJ6UEhmdFFraE9yeCtxQTcyak9zTmNL?=
 =?utf-8?B?dXNYSUxDNG9MemxnQWVtNmVZSkpTcHZNN0h4YktEcWhXOTdsYUJvUFhpQnFo?=
 =?utf-8?B?ZWxwUlE0MVBxcTE4cS80ZkZ3MVp0UXBNYkU1WWU5VHloY1N5dmx4aHJkUzNB?=
 =?utf-8?B?SXlCMDdHUjhvQy8ybXB1anZrWFNCdkZBL1d4ZkRtcGZFQTNYb285dVlIQjds?=
 =?utf-8?B?Y1pnT3pNMnZyZ3pHWk5qZm9tcnNud0lwaHhVMlh5S1F5V3owVytaTC9mbnRQ?=
 =?utf-8?B?bndEeG1uTHRaRVM4R1VxNjZVOUZjNXF1Wnc4L3ZBQWtlSU51UnQ2STRvUEEy?=
 =?utf-8?B?SmZvOXR0RmFJN3E1YnFwWi96NWpjUGhLdGlIME1vY2dUTEljYkRBZmhmUWVJ?=
 =?utf-8?B?RmVNOTQ0VjNoNGdSQ2pEUkM1ejN1NXBrWS8yZUZTMTJqRUl1M1VHWUkrMGQ3?=
 =?utf-8?B?Mnc4aFVBMzZrL3U4WllnZFBWSExBZDF5OEVtcUt3UEJ3N0lVMDRHL1hra3dq?=
 =?utf-8?B?QWVINTBySE92MEZxcU5tNE5nMHB3QnFIbTZRUW5nTkRXUXAvblNlQlRTR1lX?=
 =?utf-8?B?cGMzVVJLYW9vN0VuTm9Yc3hUN3BMQnkzWHNYN2wvRDUxM3pzSFArT3d0bEgr?=
 =?utf-8?B?cU9XWk1GYkkwU0pEdEJWSTJKV3BoU0theUtBdDl4bkhseUZFSEk0ZnFHNzB0?=
 =?utf-8?B?bnF0dkZOUHExMEdlOVc4RDg5LzJLOWNNS0NabjZ0Z1dyc2FKMHRTMWkxampt?=
 =?utf-8?B?UnhYelFRWDhFVytoUmFRWkZ5dHZZQy8vWUpVR2h6WmNlS1NKUlVEOHdtMVg3?=
 =?utf-8?B?Z2JVZjNOdkhVTkh6S0M5SDBpNFMrV1dnTjZuSzR2V1A0TWxxc2ErUnBGeGtC?=
 =?utf-8?B?bXdiNDc5VEwvZERZU3dTMFdRN3pGYWRFQXlrUTdueWRMMEEwZWFYTlpJa09y?=
 =?utf-8?B?dHh0OHVrODV3VFRDMlVVb0p5b0RXZmZQcU15bDhyMWg4ZlljU0V1RHlCL2F3?=
 =?utf-8?B?U0s1VzZDcERxS0NBM3B4ek5PK05vdlIyYmxHaFEvL1hEd2hBNkdmN2hpd0FJ?=
 =?utf-8?B?eTFJNSszcnZENDJETTA3cEMyQzYzOHZOSWRzbVhRZVYvSXVCaTdFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7dd4ec-87ac-491f-9980-08df4a041e2b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:22:46.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sl48SOnoJk8P9QqLzkve/scu9vG/b5otnqiQQc4DHbe/3ACeXY/UovZho2CThLHB9K8U25TaZCelA7hI3fOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786

On 23/11/26 23:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] soundwire: bus: sdw_handle_slave_alerts() drops alerts when
>   slave is suspended
> - [High] soundwire: bus: sdw_handle_slave_alerts() races with slave
>   runtime PM callbacks
> - [Low] soundwire: bus: inaccurate Fixes trailer in commit message
> --
>
> commit 30482e5286dcebe16b970ebf3c3846bd0b707da1
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
>> soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts()
>>
>> sdw_handle_slave_alerts() calls pm_runtime_get_sync(&slave->dev) which,
>> when slave->dev is not in RPM_ACTIVE, calls rpm_resume() on the slave.
>> rpm_resume() propagates synchronously up the parent chain: slave->dev ->
>> bus->dev -> manager->dev. If manager->dev is in RPM_SUSPENDING at that
>> point, rpm_resume() blocks on dev->power.wait_queue waiting for the
>> suspend to complete.
>>
>> This creates a deadlock: the manager's runtime_suspend callback
>> (e.g. amd_suspend_runtime() or intel_suspend_runtime()) is blocked in
>> cancel_work_sync() waiting for the alert work to finish, while the alert
>> work is blocked in pm_runtime_get_sync() waiting for the manager's
>> runtime_suspend to complete.
>>
>> Fix this by replacing pm_runtime_get_sync() with
>> pm_runtime_get_if_active(), which increments the usage counter and
>> returns 1 only if slave->dev is already in RPM_ACTIVE, and returns 0
>> immediately without calling rpm_resume() otherwise.
>>
>> Children suspend before parents, so when the parent manager is in
>> RPM_SUSPENDING the slave is already RPM_SUSPENDED. The early return is
>> therefore conditioned on pm_runtime_status_suspended() so that only a
>> genuinely suspended slave triggers the deferral path:
>>
>> - When the SoundWire link enters clock-stop mode, the MIPI SoundWire
>>   spec guarantees the peripheral re-asserts the alert after clock
>>   resume, so the interrupt is deferred rather than dropped.
>> - When the link fully powers off (e.g. D3 or equivalent), the
>>   peripheral loses power and its alert state does not survive; the
>>   early return is harmless.
>>
>> When ret == 0 but the slave is not suspended (RPM_RESUMING or
>> RPM_SUSPENDING), the parent manager must be active so there is no
>> deadlock risk and the hardware is accessible. These cases fall through
>> to read and clear interrupt registers without a PM reference.
>>
>> When ret == 0, the usage counter was not incremented, so the early
>> return must bypass the io_err: label (which calls
>> pm_runtime_put_autosuspend()) to avoid a reference count underflow.
>>
>> pm_runtime_get_if_active() returns -EINVAL when PM is disabled on the
>> device (disable_depth > 0, e.g. during sdw_delete_slave() teardown) or
>> when CONFIG_PM=n. In both cases the old pm_runtime_get_sync() path
>> returned -EACCES, which the original guard exempted so alert handling
>> could proceed without a PM reference. Preserve this behaviour: when
>> ret < 0, fall through to read and clear hardware interrupt registers
>> without a reference. Introduce have_pm_ref to guard the
>> pm_runtime_put_autosuspend() call at io_err: so it is only reached when
>> a reference was actually taken.
>>
>> Fixes: e9537962519e ("soundwire: bus: Fix unbalanced pm_runtime_put() causing usage count underflow")
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> [Severity: Low]
> Commit e9537962519e ("soundwire: bus: Fix unbalanced pm_runtime_put()
> causing usage count underflow") only changed pm_runtime_resume_and_get()
> back to pm_runtime_get_sync() to fix an error-path underflow.  Synchronous
> runtime resume in sdw_handle_slave_alerts() was introduced by commit
> aa79293517b3 ("soundwire: bus: fix io error when processing alert event"),
> so should the Fixes tag reference that commit instead?

Yes, you are right. aa79293517b3 introduced the synchronous runtime
resume in sdw_handle_slave_alerts(). e9537962519e only changed the PM
API and did not introduce the deadlock.

I will correct the Fixes tag to:
  Fixes: aa79293517b3 ("soundwire: bus: fix io error when processing
                       alert event")
>
>> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
>> index aeaae5a57c89d..b53fa93a7cd59 100644
>> --- a/drivers/soundwire/bus.c
>> +++ b/drivers/soundwire/bus.c
>> @@ -1667,15 +1667,44 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>>  	u8 buf, buf2[2];
>>  	bool parity_check;
>>  	bool parity_quirk;
>> +	bool have_pm_ref = false;
>>  
>>  	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
>>  
>> -	ret = pm_runtime_get_sync(&slave->dev);
>> -	if (ret < 0 && ret != -EACCES) {
>> -		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
>> -		pm_runtime_put_noidle(&slave->dev);
>> -		return ret;
>> +	ret = pm_runtime_get_if_active(&slave->dev);
>> +	if (ret == 0 && pm_runtime_status_suspended(&slave->dev)) {
>> +		/*
>> +		 * Slave device is genuinely suspended. Return early to avoid
>> +		 * I/O on an inaccessible device and to prevent a deadlock:
>> +		 * children suspend before parents, so a suspended slave
>> +		 * implies the parent manager may be in RPM_SUSPENDING, where
>> +		 * its runtime_suspend callback blocks in cancel_work_sync().
>> +		 * Calling pm_runtime_get_sync() here would propagate up to
>> +		 * the manager and deadlock.
>> +		 *
>> +		 * When the SoundWire link enters clock-stop mode, the MIPI
>> +		 * SoundWire spec guarantees the peripheral re-asserts the
>> +		 * alert after clock resume, so the interrupt is deferred
>> +		 * rather than dropped. When the link fully powers off
>> +		 * (e.g. D3 or equivalent), the peripheral loses power and
>> +		 * its alert state does not survive; the early return is
>> +		 * harmless.
>> +		 */
>> +		dev_dbg(&slave->dev, "Alert deferred: slave suspended\n");
>> +		return 0;
>>  	}
> [Severity: High]
> Does returning early whenever slave->dev is RPM_SUSPENDED drop peripheral
> alerts while the manager is active or after waking from Clock Stop Mode 0?
Yes, this is an issue with the current patch. A suspended slave does
not imply that the manager is suspending, so checking the slave PM
state can incorrectly drop alerts while the manager is still active.

I will rework this to hold a manager PM reference using
pm_runtime_get_if_active(slave->bus->dev->parent). If the manager is
active, the slave can be resumed and the alert processed while the
manager reference prevents it from suspending concurrently. Otherwise,
the alert handling will be deferred.
>
> SoundWire codec drivers enable runtime PM autosuspend on slave->dev, so a
> peripheral is routinely in RPM_SUSPENDED while the manager is still
> RPM_ACTIVE (for example during the manager's autosuspend delay, when
> another peripheral on the link is active, or when clock stop is disabled).
> Likewise, on wake from Clock Stop Mode 0, manager wake handlers such as
> amd_sdw_process_wake_event() and intel_link_process_wakeen_event() only
> call pm_request_resume() on the manager device; because peripherals remain
> SDW_SLAVE_ATTACHED across Clock Stop Mode 0 without re-enumeration,
> sdw_handle_slave_status() never calls pm_request_resume(&slave->dev).
>
> With pm_runtime_get_sync(&slave->dev) removed here, nothing resumes
> slave->dev and SDW_SCP_INT1 is never cleared.  The peripheral stays stuck
> in SDW_SLAVE_ALERT without notifying the codec driver, and on Qualcomm
> controllers qcom_swrm_irq_handler() will loop indefinitely because
> SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ remains asserted.
>
>> +	/*
>> +	 * ret == 0 but slave not suspended (RPM_RESUMING or RPM_SUSPENDING):
>> +	 * hardware is accessible and no deadlock risk applies since the parent
>> +	 * manager must be active for the slave to be resuming. Proceed
>> +	 * without a PM reference to read and clear interrupt registers.
>> +	 * ret < 0 (-EINVAL): PM is disabled (disable_depth > 0 or CONFIG_PM=n);
>> +	 * proceed without a reference, consistent with the previous
>> +	 * -EACCES exemption. Skip PM release inside io_err: since no reference
>> +	 * was taken.
>> +	 */
>> +	if (ret > 0)
>> +		have_pm_ref = true;
> [Severity: High]
> When ret == 0 and slave->dev is in RPM_SUSPENDING or RPM_RESUMING, can
> falling through without waiting for the transition or holding a PM
> reference race with the slave driver's runtime PM callbacks and still
> deadlock?
>
> CPU0 (alert work)                 CPU1 (PM workqueue)
> sdw_handle_slave_alerts()
>                                   rpm_suspend(&slave->dev)
>                                     /* status == RPM_SUSPENDING */
>   pm_runtime_get_if_active() -> 0
>   pm_runtime_status_suspended() -> false
>                                     rt711_sdca_dev_suspend()
>                                       cancel_delayed_work_sync(...)
>                                       regcache_cache_only(..., true)
>                                     /* slave->dev -> RPM_SUSPENDED */
>                                   rpm_suspend(manager->dev)
>                                     /* manager->dev -> RPM_SUSPENDING */
>                                     amd_suspend_runtime()
>                                       cancel_work_sync(&amd_sdw_work)
>   handle_nested_irq(slave->irq)
>     regmap_irq_thread()
>       pm_runtime_get_sync(&slave->dev)  <-- deadlocks on manager->dev
>
> Besides the deadlock when a domain IRQ handler with runtime_pm enabled
> (such as sdca_irq_chip or cs42l43_irq_chip via regmap_irq_thread()) runs
> after slave->dev finishes suspending, drv->ops->interrupt_callback() and
> handle_nested_irq() now run concurrently with .runtime_suspend and
> .runtime_resume while the codec's regmap is in cache-only mode, failing
> register accesses while sdw_handle_slave_alerts() clears SDW_SCP_INT1 and
> drops the interrupt.
Agreed. Holding the manager PM reference while resuming and processing
the slave alert also prevents this race with manager suspend.

I will send v9 with:

- Fixes tag corrected to aa79293517b3.
- Manager PM state checked with pm_runtime_get_if_active().
- Manager PM reference held while resuming and handling the slave alert.
- Commit message updated to describe the revised PM handling.
>

