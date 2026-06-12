Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548034252C;
	Fri, 12 Jun 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256449; cv=fail; b=dl0TscTTPu0azC3eSyLwFw5+FupMFbQ13BSD5YIsw2nbrWfNlZrY3H3yadmt8gqyTzmP3osLEZqN3zpQOQnx/T1/f+u7io9mLwnd9SDDI54sO1wy67i6VWA2Z5g9FpdpKm87y1LqcVMXXtDKppA9GHpg3bIX2psTRCt3TaHVeJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256449; c=relaxed/simple;
	bh=cy3z4cb3eXBwpmtWsVHU+i8vLpbgQk0/PXvE6wsH4fQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IiLxW4tth3bjACYxTBXcMfIW2t1pXqO23ntJg/0m1f6NNIUN5auKnOmswykxe/irq1lrUTxdajQ1YlrYoXdQ7km+PP2Opk6ToTZINZDSQETBWhhgkfFD5mk3hqvMmhSHP4YoAUmRsG3U40OEOcL/MQte5hRrL8F2iBbTBpw7sWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mkkxb3gq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rps132IP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mkkxb3gq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rps132IP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7NKXW1929314;
	Fri, 12 Jun 2026 09:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zuEKGlLpXZ9lZZ68yCzKJivshvpYyojcjP3AdnHs5dg=; b=
	mkkxb3gqcyDWOBEpMeKGv/shShtJpCuVBjDKnsVeDTjngKKwXxqYDsP1PWTZ9nPN
	CetvsTUYwDs34GSyR7Tw1AeKt4zN0WwgwIgs1RwvKO3winzm5ho2eJmhXOvWevDf
	0dHU9LWzyusHqx+Y2I+UCH+8otw7fjnBsP58LjyXb1HHhDxLoWG0B9bgSAR37Dy4
	dIbpZr5IHad99VN/jBejIIrtg5/4ZlRBunnl6Agu8JMbYSrxKi8bn4ZFPtUJPf4l
	dOMAwC6joBa4tYNsN3oM3zHRHGBQW0VA2GuZKv9gaBj+wkAc4IX91/UyU97BSmTW
	aJ1Z4uL+p5cmQvlY6ZqcLQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6utpvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2026 09:27:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65C9MtbI024810;
	Fri, 12 Jun 2026 09:27:18 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erbneyp59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2026 09:27:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpLPhfo+biu3dS5s4eQYUdyLg2kU+nPyHTh0y2K9gtQHt+lXHBdehitjotx7n0GavRlqJFzsdnhvQFW8hcof9rHVCiafqMk7x6MEjC/Nl063oKEkVnkgU9CaXykTnFaEkpAkMZs4AHQQB/Bisdjb7y4N10zKqW9AOWPUPhAdyuxhVBRi3rGhdBXdHhGCPMEcqjNl/ybIYxQknIqqPLJ3NluGMfuAPtR8a3hAaT3MFO4CsRYVUOa0ZZlqP1uGpzBln898RsyA1iobjJtaF8VPPi1gKFYi6VcKjtL0blEpJORDh3cQwlz2XzLG/4FObe975XgLFjVS3QV+3yKl4hn1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuEKGlLpXZ9lZZ68yCzKJivshvpYyojcjP3AdnHs5dg=;
 b=CdNh5XEMwnJIVZKtsb/b4vBMPkfwCG0gsdpJgacpMLgetEbLywRU/JbCEX1a6DIHN6hKSgg5aiPA8gVg/f5Nx9h+a1h56nxvYWB9m5m1Pnrba/W54IfoN3BU2VxHiFrSrs1L/aIWn7OehmJJYxFCsx6L+y4/5acVWMq8k4dkzZu6ZxqYpmUCYfwMrXGAK4Fyyii36xY4+kkP5zigH4Y32HuC+7dY3PJjZW1daBnYTWi6A7DVEfcsEUCivpZT1yCyNMexoRu54BVTiXwBYOXfyfM4voDnViOmDGPnyi2QkorFyVc2BVSYrYXI1Hspju1VBr8yytkIA69Kem84uG8pFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuEKGlLpXZ9lZZ68yCzKJivshvpYyojcjP3AdnHs5dg=;
 b=Rps132IPUuXs92qCbR2+y5xOXgOtKS5YC0ZtuS0j/x+MjsJtQAhy3SecsG3tJfwE+i5r4gXvux1ZwW5cZJeOPb6k5oRlyihWzYP7VUxDEztI8wijSotzfp8dTOB1dhavB90lOE9L0QGRFOnmOzFTuN8msJzFfhoRFClEYbfMM9E=
Received: from DS3PR10MB997700.namprd10.prod.outlook.com (2603:10b6:8:347::19)
 by CH0PR10MB5146.namprd10.prod.outlook.com (2603:10b6:610:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 09:27:13 +0000
Received: from DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a]) by DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 09:27:12 +0000
Message-ID: <759513f4-f76f-4e80-9bc7-4a3691a41613@oracle.com>
Date: Fri, 12 Jun 2026 14:57:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: imx: Fix device context UAF in close
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
References: <20260611110534.573543-1-harshit.m.mogalapalli@oracle.com>
 <20260611112346.55A4C1F00893@smtp.kernel.org>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20260611112346.55A4C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:260::6) To DS3PR10MB997700.namprd10.prod.outlook.com
 (2603:10b6:8:347::19)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR10MB997700:EE_|CH0PR10MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3764fa4a-7a9c-4656-19e0-08dec864c87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|3023799007|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5elfSbFk8Y396KEqYAGqWrsimdpPqJL0sxgt9bfvFJve0BLpoQ1UMuqY1n5s1JjusgZNj2oBOXXitfFYTj36OPbSVlEpf+DgsKCF4CK/9FFV3rqukaPKMn9VaHqnmd9zCIxbPtQui/ec7mlLbOz27l8v2y4HDo6TSOcXwpDYxR+ebb8Yn8fhGmWpZhfDl/WkSK2AbJeWJtuQwy+AFqEIY+XU5n/2E1C2vMNcg47zifj1I1a/XerFq2HWnRbj5k71jkmaz+kXNuF4tkZjPWhd7vdBTjkFvHMDxEDfTGRbnmy3h3DK9Ru+H/qtrHT3fJyX/CpSdNWBQNh5CFnZBLljuy+VYUFRmj2d3Nn0C0LdJZGPcwiuHOvJsTN7A0MzrdM8ZysG67S0tbxzMSlHeuCcyrSfJSfdEvDgF9Do+MwBiWZKspqIHW2aDf6OkohFysu3FMP31UvnB3bTqVDE98ROVnsbkgsLnuHV3Fup3ypU3OyXDFuNraKLYtMaeNO9l4wD2ZqQeOQllNHgx6nqqiVjo9llAtGtAWjNXgS8YOz9IfaE3BBUzH15LBDQ0lLuWr7WrQqFJAKeLNGtmjeYln9dJo1tQWLEGBwC/eEdIBXQb6sI5jyS13gwV32B4qPwFC8geyM+uqhLPXZZXAslsDvsknofD+WewfjBwYVAZ3meTm7fxwwB9mTxHBXoQfOeW106
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR10MB997700.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(3023799007)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjVocUVPK1FLTjRSa3VPSDNtNjRTMWY4TGNObkJTVlNOYjdGUkliakxhaEJm?=
 =?utf-8?B?cFdpa1dCak1tRnJIclRFalZOcWFFaHIrTDBzUzhNK1QrWlVxc1BJK3NmdUUw?=
 =?utf-8?B?TU02QVdNbEdaM2wvUWUzWUdXYmFtMFlzcU9MWDgvT0hYVzZ3WmlqYnpEWDdF?=
 =?utf-8?B?R1IwRncvcGxJUHlTT0xQN0pyd0lmL0g4L0FjVG1VRnpkaHBlZDRMUFFKSGVj?=
 =?utf-8?B?WTdNOGUxLzJ1OGtyakFBbWZXb2Rpa0gzN004L0NPK2NzWGpVdTdXWVNaVERC?=
 =?utf-8?B?ejl3OUZaQ1Q0UEFaUHBIK3BtZTN6bTFZdXJmd3p0ZmxUb2daelhpdi9DbFk1?=
 =?utf-8?B?bnhpOW9EN2tLUFQzUVc5NG1YUVNLb2N1Y0Q0aUxINTZLUXR3SU9ZY3lxZEo5?=
 =?utf-8?B?dkE2WUxaVjQ0K1V2a242amZMNTFadWhBc2R4NVRMZ2tsKytDN1JUSGF1OWJ2?=
 =?utf-8?B?d1dHUVVvTFB3S3J2bkpiT2VwcjlEU29nUWN2RHpSR01DQ1g0Tm9VTUk1VE5q?=
 =?utf-8?B?UG9qcWtIVmpiaExzNjJPMlNpeEExWHp6QkZhL3FsSTJyN2NMalhhcGVaNGsz?=
 =?utf-8?B?MUYzZWVTQ3BlYU5IeTZsVXZuQlZpeWJvMUJoZitxRG5PT0VGSWRMR2JYVllp?=
 =?utf-8?B?TzE1QUZTb1Njd0pVRUVVTWU4VkNGQ3pJMmNkOVZKVUMwN3pRVDdQQW5Sa2dX?=
 =?utf-8?B?TFkybE45cThYaXp0bnc1dXlKcGlhdXVrZUIzUWU5MGQ3aGlJd1ZWaW5xSG83?=
 =?utf-8?B?K0FMMklWUk5mcUUxUUtTNHlobEVuMXNqZnMyL3ptMGs5eGg5WjVtRnRBUWZ1?=
 =?utf-8?B?d2laVFhNMXk2MDV5ZUpjK3ZSbERpdDc4WVgwVHRpelhiZlI2Ymx0T21WbnNj?=
 =?utf-8?B?MDRUL0FGWEg2aGpyeWgwNEFrWFlsSEdBNHB6QkRFeS9FbEJwNUxSeFFxU3RX?=
 =?utf-8?B?dVBxdGdTZ2VQcUkweFZsSEhJV1JnRXc0UXY4RlExbGp0bThCMXMvRXEzRVRG?=
 =?utf-8?B?OURXZUtVMGJwZllTd2l6Q1VUT29lYVBQMUxDeXRCVmtENVdSc2Foa0t5Z25r?=
 =?utf-8?B?VTdTZVl0bGZERmNST1p4QU5wS1Z4cXVVWGwrdlBpa0xIVGtnVjNsL2syejE1?=
 =?utf-8?B?U3IvNWpqVlRhbFRUcmxidmk3VEJicmV6VVp6RXhLQjZRTUhEdkJDSWZrbkh4?=
 =?utf-8?B?RmJCaURtOWxGWmVyNXhGbjFEQSsxRzgxblFNZGdudmlGVjV3OWVFNjNNa1VX?=
 =?utf-8?B?QkdLbmdMeGZTM1MxWGxNMUVXRW0wNTQ0d3ZDdHNSZjJKb3Axc3BUNnRaUkJz?=
 =?utf-8?B?RTNBVDVTRGtvcTJDQjF2bmVVa1J1bUdsOFJ3R3BtN3F4MU9jSzN5N1N1QURs?=
 =?utf-8?B?eS9NVEhjMDcwOXJyejFSNlZ6MGYvSWNtSmRkdjlCdGxpWjVsZmtPV0FlaHdi?=
 =?utf-8?B?SUhoN2o2b3BGMmdFVkV2cHNpTDRpdjNNQVBNRDlucEthZTNwN0daQ1JWWEZI?=
 =?utf-8?B?VzUwcXVtRlUvNzhlM2xYdkNSQVlOOTE5N1p5cVUyUjRHWHE3VEczbm5VRW9o?=
 =?utf-8?B?SldDZWcxMjBWOFY3VU9iVzVjc2tNOGhtNFdLMEpmL1JGMXJCK3hVNjV0YnZX?=
 =?utf-8?B?ZVpmOTRScW44N0RCbEJWQkFEZFdrckVxK29uTUpCd2xzRTFXTUdRa2YxdENQ?=
 =?utf-8?B?dWxrd1pOVDVFbUtXb1BaTkxVK0pJa3hNZ2hJNkgvVVZrTG1FcUd4bkNlZ0ww?=
 =?utf-8?B?UXBJZ0RJSmdmVmxmZmNERzRLWlJFQlRPU3M4dUdWWEZqNWgySVhwU1RWU0tP?=
 =?utf-8?B?TGE5Nmxuay91QnBTTEc5K0R3elZYMEl1MmJaRnc1UEMzVkh5anZHNHF1ZHdt?=
 =?utf-8?B?Yk85Wi9JUXZGUHczSW5mc1pwaHhYTm1SN0dGZEhGekZVbkkzTXhsODNZa3FM?=
 =?utf-8?B?R1lLeTJuKzJnZG1aNmdBVUcyTzd3cTB3eis2WG9QWm5VSFc3aGt4dmdKZVBo?=
 =?utf-8?B?MkYrTWovVmUxNXZhNlpodjh4aENGdGJaOW1IbFE1K2ZWdkU5ME9EbkpJZE1O?=
 =?utf-8?B?QitBTGE4UE5hZDVaQXVmcWRJb0lBWHVIREJJV0tKVW8xN3FSbmlnQXV5dmJH?=
 =?utf-8?B?Q0xsVDM3R3B2bUZCck9oaCtZSXFTcEFmS2N6Ky9pRnVmNjdvTDlNL1ZsNmxn?=
 =?utf-8?B?b1dodlNqMDFCenhGbzJ6UjJoeVlkQ1RJaElFZTEzSFZPd1NzZkNOVXBHRmh3?=
 =?utf-8?B?K1owNHNMTjFia3ljblN4MytOR1FPQnRyTTZoZGp0YjYyeHg3V3lNcjJEc2Ri?=
 =?utf-8?B?N0xNVjJ1Qndmc0dld3NDWVM2TlFiTUZMOUYxaVlWQjd3cE1DQjVMN05PdWZG?=
 =?utf-8?Q?1Wy4wbd+uOMSA3X4RQSPOs+wOc0mYgyficFfR?=
X-Exchange-RoutingPolicyChecked:
	Azr6j09n8x8AfRBKvXXj3PpdFIcsh8Uq6SZV1WPEvhUCcdCJ8so/MiqMsxnKK551BoanGYvlQ+LrU+bgVouz/V+jY/essH0E4RenwjVHLjyp+ps06Gydsj4LiQArZL1jc2gdm6dHJO0oL+TqTlbKwPd90e8Zp+iBhOo/BOuLPh2UiFkiLDMTMPaZkMTnxFHXV8rICfNbZC979Mwo0YCuhRF0wVqBnc5WrL6jFkXwegEMyrOZCQKgCqNKzAWc4XihhBsNlOBoKGEYuDnLhyj1ekVMW5K8MxQyFWRxw5Ag3fjeAvkGl0BrtGApjIQ4F2I0MG7GwSUox7kA/LrQkKtdtA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	APMkY+8S5etYf+YLwiYZ+CQUz4FCOLczSKxSY0OBMVH9poGIxcefE9HYpCAX6e23IFvI4cBuqLCZGnkUbNQ7Xal2EmhF9jc+PvXslbdC4v3Ti1bUoCVzJvlzDYt+piPiFMziU4NkOko/5usnZcjGWmgo3dAoN3EJMZ7uRjM63SSbnLjn2lV3AWmeeCMGpOe9qbOb2GBBulldBvb2UQfvrzQz8bBltUzE43TTYUZoOb4odvBYBgnR4CK+ZsWalhPxqanxDf3oKbs9r8Tgdn+0pAAYdahpdVLfM5gvtE+VADbTxGFGPZfyH2+NV8o/AAvG7TOMbkTNk0asg/THgcs4W/88KFiYq3rrPkIKZjPTpzmObOxZ0dZfDSKo+N2HRHHwPRvef/GXynAT3QlwT4gPpmLOnaLkOarXDBZeBmGV56VZtCw6dtR92Ssn0X6vwbDYviqkfkMPhXpRwdZaLoyqqxQDVH8uDa94sb3ipl2km1m10GKYaqY/huo4TgLfQ9GXwvAFFak0gy+2PpVDUMC75rqu9QPVzBpjOFH5ylJHaN7jhH/Y/xfwpQ5jD6Q4FmVPjPtpML4zD313P4ag5dpIAe+YAzQ9Kwf7khwexdLSXQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3764fa4a-7a9c-4656-19e0-08dec864c87a
X-MS-Exchange-CrossTenant-AuthSource: DS3PR10MB997700.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 09:27:12.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41CmphXu3+PBtgwGZRH86rcDI83H6N/JJksKM8yg/H+rsFESHlpycKv2SexzbTB8x7NguOA17+6B8ID3ERNwc3LemMYXGMNYrevA2tz/pzrEMT9dVisNAHdyq9l0ggq1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5146
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=906
 lowpriorityscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606120084
X-Proofpoint-GUID: 9wxcsP4KPK5_UUItk1EeIaWZfOnshwK-
X-Proofpoint-ORIG-GUID: 9wxcsP4KPK5_UUItk1EeIaWZfOnshwK-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXz/ZDR9HEniW6
 PEb4nX6hvLdC0y9QUMpv0nau5dMalb1gaZce8jcEUxYUz/ki0xF8UEnhlQcewycWjJYui8a6kpQ
 IqYUB+mpmwnQ7njaMgUTV/hHhRvpUI89KwzfwyaXEQxB4XA4oy+5
X-Authority-Analysis: v=2.4 cv=edINubEH c=1 sm=1 tr=0 ts=6a2bd0f7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8
 a=W85nqqcw8h524DXt7YcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX6J2kJJYiUHbo
 MHuojVQ47J0lbR9T/o2daw0yzaOxDGcl3cH3PzcnsU/zScRZIif9MwRGm2A+P5X2JCb8g7ZuFV/
 Agopx65w1i5X4Uwo1gxhHwqlK3haG3jt0UR53CLAjjlfn+4x/R2Celyoo8/woAb5PGFsIn5hNIu
 EBq7K0SjHv212SAbrI8x8QajAaQkDAOekPnZAUH4IHpbeTHC9QYz8vmkWhKTRsP/gdbN51Dzw8q
 SFBT3xRIVJ0h1/LKMcY3IgGTRoev/HbfZ3bshIirdeSl8sO0IRv9vuuKN0C+VlLGKYFKI0TxY8U
 +xPSB2q5XrYO10ip/+FMIg6BDRdd2hlMBfb2h+ts3JxYq1KJOb0cVyPOKo5jEscEDRbNh0hkiSH
 7+bArl8DjyaJV+887y/fTAYKGPgPi0AjTAn2mXxhgIgeqt4HusgdnR1OblUwossJlx9IgL0nFgA
 Gb/vGVBqwh4Y5F2Lxnw==

Hi Sashiko,


On 11/06/26 16:53, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Blind dereference of `se_clbk_hdl->dev_ctx->devname` in the mailbox rx callback triggers a kernel panic.
> - [Critical] Heap buffer overflow in `se_if_rx_callback` due to a negated size clamping check.
> - [Critical] Integer overflow in `round_up()` allows massive out-of-bounds write in `se_ioctl_setup_iobuf_handler`.
> - [Critical] Timeout in `ele_msg_send_rcv()` leaves `rx_msg` dangling, leading to a Use-After-Free write and NULL pointer dereference.
> - [High] Using scoped_cond_guard(mutex_intr) in the `.release` file operation permanently leaks resources if interrupted.
> - [High] Concurrent manipulation of the doubly-linked list `priv->dev_ctx_list` without proper mutual exclusion.
> - [High] Data race on the globally shared `priv->cmd_receiver_clbk_hdl` structure during `SE_IOCTL_ENABLE_CMD_RCV`.
> - [High] Lack of synchronization between `se_if_fops_close()` and `se_if_rx_callback()` leads to a Use-After-Free.
> - [High] The driver exposes the device to userspace before `probe` finishes, leading to a Use-After-Free if `probe` fails.
> - [High] Bypassed bounds check for exception commands in `se_if_rx_callback()` leads to an out-of-bounds read.
> --

I will try to work on these and submit fixes for these, but these are 
unrelated to the submitted patch.

Thanks,
Harshit
