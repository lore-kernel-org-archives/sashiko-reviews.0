Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29A437878;
	Wed, 19 Aug 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131382; cv=fail; b=NN4KAcb/TJCHvaQXYX/YAy5bWCAi1yk6RGdK60A7FQ0dU7Usg3amXrfv2iknW+GV4CO8Qn1IhtotyrBsgQmBkCvSudFXsLWimQOzuwgTI2mmRfuhxyfRIIwDK4OXHyjaoC/hRA6mgIebfRiOTs+1bV/I+Y92lKINc7lVK5YqQoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131382; c=relaxed/simple;
	bh=hem7TtVnKS0ISsAi82UujUZ4IiuOvN2AgW+qxhcR6JU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hcCWOxtV4SAERrq9rv1znDdS05yd3CBkK73Lk2C8+G3UtjnynmgWfvYhSY+5JOJFSXYIPvyH7UUC9FwHzvwGTzpTylaFY6YGdqJIkI5eXpdELiIMFynS1rRkUwyW4SWw1+hBO2pnSZG7CWG/F1LVssma4YIE4droaJMfmlSzlDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=SCOPALe7; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="SCOPALe7"
Received: from pps.filterd (m0209318.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6TrMh3981759;
	Wed, 19 Aug 2026 09:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=NGQtvKh
	sY0Pmde5/dVA6wroaQBFML2toViS7W5oLg80=; b=SCOPALe7Dz7aQSBTcEYh0Zn
	VsT2MEB6eirScO1gvvUeNA3jijtEyHtpCpMB8NyaFzghhqB5dWiZ84FcSBckFWSY
	Z4+WHO88HrzzbFWUknaKhT5x0edsARyW3GwIczD1jqZKoHxcJp35UObG5WEJvkI7
	TjfRq2372kiZdihWN2RTptu4teQYlRz2Y0FSrbNNZ02YogHuWUHJ0WavSg5FDaOj
	bLbeu+MAsphHrp2XuucmonV5mFGJTe1Ab+P2rSA2ieCp0a45+w69xfac949tNPhb
	YpxIunPmaIuI5aRn0sdc6EUXW/nDSh6szXc915cDF/oFkjLKy8PbkaUTh7SfgTw=
	=
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g4yemgrd9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2026 09:22:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiK8RzMKWBIxlRItcJ/VIiGH5LGyusL5+GEe1iiefczVI1FTassMQ7nq0soc3jHvbj/m7nHHiL1qYvE6DC4ZO/mHrC+orL7eXbneRpDPpQQC91g1AG4jAaOkA7fYJQjPDPuD1/jY7z9pojfHMZmhx/3tChklFzpNL31XN7bF0oClY5URgnuYAC9N3+bcOQ3iifdhqXX5Qszg0ZcWENcGanyQVgnfqIbEen8KUr6DSLDopV6eSNdHGeJldfwe0yX3eknkGydoNsJPRQ+A/J7GQ9bNTypo8m/imGmOk9zBpxv7YYqscTAhlVzWc499W6E11WHxGQXjmR66ZYjCiEggqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGQtvKhsY0Pmde5/dVA6wroaQBFML2toViS7W5oLg80=;
 b=mujy6uPXX3ATTr44JD3T551UywzZLAEBLmzrYyCjJRC/abPWafwZ9pO+bUH2ErFmE22bGp0LS6XOdHP5oCTiP36VGmtDFr55x0eTioyX36qxyL9Ej9mNDgTPracglJhHsh4Zi3GOZ5DIMUTWj45k4a52/lSdeTPXkCF4A931jJ7/WtMCwvRYGEpzCEBBQMEbUY8FuOOb8LY1rh7qIdaQ4HUV2QVDZdIhMKEREV3HxNdTy86dQXOIa/8IyFxVy21/29As9Mm9uz5GOq+/cjbdE88jGQVjEJf5Je5VSoMHl6fkhNREvpx5eqbIyOPsc3/o8YDYmGDqVvct3MvbO2Ad4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14) by TYRPR01MB16438.jpnprd01.prod.outlook.com
 (2603:1096:405:142::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:22:18 +0000
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a]) by OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:22:18 +0000
Message-ID: <2a91eee6-c5d5-47ac-b0d1-9d50374be46d@sony.com>
Date: Wed, 19 Aug 2026 18:22:07 +0900
User-Agent: Mozilla Thunderbird
From: Lachlan Michael <Lachlan.Michael@sony.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-2-lachlan.michael@sony.com>
 <20260806072055.3A28E1F000E9@smtp.kernel.org>
 <20260812021623.GA548637-robh@kernel.org>
Content-Language: en-US
Organization: Sony Semiconductor Solutions Corporation
In-Reply-To: <20260812021623.GA548637-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY6PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::15) To OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB17833:EE_|TYRPR01MB16438:EE_
X-MS-Office365-Filtering-Correlation-Id: dde31cd1-7be6-4924-fa0b-08defdd35d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|23010399003|10067099003|56012099006|4143699003|3023799007|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XZs6qnPyRHPL/XHJ5Vgy222UKVkbCPIrNInZ58z6tuK+80JKEmOgBbzqYoqxs1i3hDMrRyLLJD+nSa9Tn7/o7MTy3nRDEWYQp5+ri3N218/sMW69BIpwYxaDlNzvDcnqbCyiYccR0htGbNfr+JAjiwuAL7ad9QZmX89nEuh1hocJncnAVtGbSX6F4lviRgvIPliq959inCYiPDMwS9FzfKfM+Cph1G/lR9oKA2PLjSOCiGQdVPwN/lKJVp14l3ppU46MfkDWIXIOeejDE6UxdfrybFs8Lf/Wr9iqn9pfI+zDrC0zLfgPRWsTWJ8UlJYV1qdyZcQDjRrF/413NFCtkSB8VC0e0FE/49GyI40gqniC7tQ6KWIvcdVq45UcXmJ4vutmfegEE2S8pXCy+mkRrknHAeQldP0G2OyZ8anOGp+5Xmg7BVviVgXAkn/s89xJLk9epXsISPXFNhgWD8RpYNPiijJHIYxXl7mVW1Bw5tQRWiNdqpguNlofxhG/tXBGuUPOjfxAHj0YPQXC7lpNV5pVMceucSgqdTZdT0XYlErKyzq9iJZAPWUrCS+nN96mZgii9/SOEFc1mSJVw7v+SzqEjzHw2cnzGZXlcE11WXBoHvO6jwC+npGFhEEtFEKZE8k11ENee6nkvtaL2eBbgDREh60G1A0b7ygvZVWLaWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17833.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(23010399003)(10067099003)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkRqK1Y0UVoxTDh1aDk0aDIwV0xuRzN4SVZSandzNk5vK2hBeGF5dGVrSHh0?=
 =?utf-8?B?VGVoM3ZyVWdtYncra2NqK3pQRk9GK1NzeXJoa0xsTDZHOEkzNS94WVFDTUNt?=
 =?utf-8?B?V3llNUpkZnpQZ0dXVGxTS3RQTEk1ZGlqYzdKRjI5Vm9nNmtnSDkvMW1LTkJp?=
 =?utf-8?B?UTdoZnBRakVwSEFXY0VLV29yWUtkaXZ4TWIzS1FMRHRmWmNWTU1QT2dhcUsx?=
 =?utf-8?B?dGdOY3NTbmZ4bTh3Z1UxeER0R1lkMHRhSUUvNWFmRXZRRWlrMFhxN2JJenBP?=
 =?utf-8?B?eFRxRjNWZnVHQkcxOWd6UGI2OTNZQUJ2L3RNZXBCUEsyK24rWUtIS0dveXhQ?=
 =?utf-8?B?MjhZdGhEWmNSUUxqUldxVksrTE5YZ1ZhQ0Q5c0JuODh5WFYvRlBrNDJvUFFV?=
 =?utf-8?B?VmYzdFNsYjBLYnpIbm9VQkxqSlpBQUdmektnRE9HdTloTlB1QlBEeXZ4SW9j?=
 =?utf-8?B?WStiREhPSnhtT0J3SnVPTElnQmVBVW9MQVYyUUhqMENuZFdrR1RCbUhiVWc3?=
 =?utf-8?B?OENJKzZFcHNsMDgyZ2dTb1hjaGdDSlZEcEQzcS9JakpTbit3S3kzQmJmOVNO?=
 =?utf-8?B?YlpLU3gyR0g0anhyV3AxRHhQWS9lK1YwUllYWW9xWlI5ZHdvdlJrM1pMVStx?=
 =?utf-8?B?MlEwblErNlpleG1ZdFJZQUFoNVdCSXVpcC91RXpUcjNrdEpZZE5tdjdHOEM4?=
 =?utf-8?B?K1NxNXpseG5TRlVmWk5WMmFpSnBnL2dTWGVSWDdIWEEyYml1WHd0ejZIYjVP?=
 =?utf-8?B?NndZc0wrcTFicXhiN2Uwb3VITVV6YkJ3VUFFUHBHMGgvSnUySW90cWJHRXdz?=
 =?utf-8?B?Sm56OS9iL28xQ2ZKaEtpYmJJZ0M0aC9wanZ6cm9RekMvN3VkWUpNcWs1d044?=
 =?utf-8?B?d3BXaGVtRXMxZENZUGl0NnpMY1NBU3lTWFFRdklsOUNtNVdpUDJVRGFrVXlT?=
 =?utf-8?B?NnA5bW4yajd0NWxCV3J1RVYrbVlsRFpWU2JBNi9PY2UzUmUva1BGQmtzNHJS?=
 =?utf-8?B?dnQ4a21hdWZBcklrUVFlL0gwVWVtQ0lYSnpRdUtiUzNkellUMXRSNkEyTkJs?=
 =?utf-8?B?UUlKMnNQWVMrOXBvNXVpUnpFTTRxTnV5TmNvZncvc1dzYitHR2xOc1JyWlJ0?=
 =?utf-8?B?Mmc1bStYZUZUb21CMEpERVBQZGIvRVlPek1Rb2xLZ3hYaXJPSkVHTFFpMGEw?=
 =?utf-8?B?UjV1V1kxVUZQQUJPTW1wQ2tiMmZWa2FkQ3U0Nm5aaFRid0NhMXFReHpjYndm?=
 =?utf-8?B?NGRoWVVSQmNwNXpSQkJNOCtIZEM2dUY2c0hYQnhSaElNV3VpRkhyK1BJYTBv?=
 =?utf-8?B?dG9jZzlzOUlaWk9aaFJ1RnpnbEJ2aWdBWGNoYlRscElIczNhdVNHQ2RzY3E3?=
 =?utf-8?B?bHYzYWxid2RONGFSNk1XbElHQ01mVjQ3ZVA1OEdUeFJKSW1IaTNkMmpGT1Zj?=
 =?utf-8?B?YnlsSHBxUFRCdkVZaDNLcVBHTE9JdWIwOGVuUTZnYzlFVzBZOFBFeFRIbWM3?=
 =?utf-8?B?WW1yai9JRkFtN3c1eXhkQ0tSQkloV2U1YmJnZXZFVnNjbXlSTCtlMWNDSU03?=
 =?utf-8?B?eHZEZ2g5d29GUVN4eVFYRkJzWnRmNE5MaXZGVm9OeWxKakNDaWhqYkhSdGpY?=
 =?utf-8?B?dmxvWWhhZVdCZS9YODB4aUs2bW1BTndsWlNPQXpWOVlJcG9tM250NGFnUUV4?=
 =?utf-8?B?WjRCMUwrMWkrNlh5eHJnbDUvcmhnT0FIb1pYL2VVSWpPSGl6aFB6Q3NuRkhq?=
 =?utf-8?B?RmNubEdtbHRxVW13QkxoSGdYYy9JV3Y3UmxtVE9uUjZubmN6Wk9aZDRsUDdD?=
 =?utf-8?B?OGdOaGdueWlqQitvaTlHbW9uVEppSk1pTW8xSEtuWm9nUXRDS09CakFwYzFz?=
 =?utf-8?B?YW5jS2Z2QTV6UkFpTlpPWUxUSmtzaEVqblJFWHRlY1BHOUtKZFNFd0NFR1A5?=
 =?utf-8?B?MmZUY1lyRFdyM0RNK0RMR0RnT3BzOWtucjNoK1orOUJCVUh2b0UySEMvNmsr?=
 =?utf-8?B?UEhrTVY5TGV0VmgwZTFNSEdKK050ZEtNYmJxNjQ3ZW85V1BLQkhpU2puMU44?=
 =?utf-8?B?T21oL0pqYXdnRk9hYTBRWWczUmIveUROUEZVZlArTlozUnlTcC8zY2VITFJV?=
 =?utf-8?B?Y0VBak1ydEpNTFFRUzVHNFprWVVYUERMbmt1c3RJaVN0SGVaNTdMdFlYa3pT?=
 =?utf-8?B?SjA3clJHcUx1TGFXSUhyWXlCZ3VhcFgwV2FSZDFzZ3hvK2V5bDdyQ29nMWUw?=
 =?utf-8?B?VFlrM2FGVHg2QzhNR214RFhnUklCeXg0eEFINHNYTjFmUlZESWpuTGNaajJW?=
 =?utf-8?B?N3Z1bzB3TFk5MU8xb0hOak5DMUlxUFZIT3llL2hxOUZjVE8zOVdmN2hjRFNn?=
 =?utf-8?Q?mex2jVYDayA+BfRzP6qegl3N6uHuswH4Vp4vB0Sg4YjI6?=
X-MS-Exchange-AntiSpam-MessageData-1: tWN3U7cqGUGlPjsqoF+q4BEWaC2Owf5WUTA=
X-Exchange-RoutingPolicyChecked:
	QsOhFr+LRHcLehBlP+xJyX0xfRAnICK7VWuqDB3UESNVTQFrzA7twaxyU5noNcSX1RzzxfdR+R2KXRW/j35FdKqW/Z6iHWYSvDYGQ8ZlExhUybV2kRUoJcZdcmB+GlQekojWUYB3LPfbYVUhDBCjBcY2iTyC/1mIwyXRMx7/OZdTd5pEXqYA4cKkvwGmCWRCBsZ1kKpULEqoMupf+4IrvUO3rYY3KrIGYchH1Jim3Qda62fY5xhcYS9CNP+nSoU81KTLgRcenONxffRiIfBdAEjShGis0gmn7+BsqLBxE3uZw8GMBNX/TTrUMLkG6I0ASwOvkjMPgWX+L3QAn5NArA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8/LLAhMx9ftwZ13r/8MCf/0vyiQYCPIBro4T9Q3J2sYjf4dhsA6omX1UpVi+aL02Q7CAlA+cdmXmkXvVQLTcpYGSUbMIeoY/CRxxXrHGnCr0LJMQTv2AiiyPJTgZmNCjxHpZ019IqAeQb511OFIaESg0hYfjJGnWrYeIb8AJqrfdP2KmOmu8cbVADwjNsUelkdAzrvylpPi0dJM9Hm+42rEA38a56c6ODzTMQMhkb9zYlE33GMU6mr5hFN6sdLy7NKJA93WLbdPKpely38nLGqlr0CWs2hwFg8++1SEdW2DdQAYf24C3dYK/gVkGXJKaHFvCWaEbAzApg4rPvObi/hCnjxvoH5dFDthRwNHCyDMo/nD2wYe8q6ezKCaJtAvohFXXyFs88n/Jfmte2thH2lp/ijgKr9YxhDQJBdyahzXockNIUb5eD/ZSwIPEETkh0ZQQxtppJ0IRJXUQ9u3muJgpz7yaO7951SZwci+h10za6XwUzOwq1aLA6xJ5Yl+dskvE+ZjHjXegbybDp5i5wsUR0jehiuH12qPnr7IzoGOX/dGrSL/+lw0Ya7tGPKMjO/zaQ9/JWFp+DWQuPvRslzgi348v7l+Al7s+ZX+XnSt35o0R4UMPJHY1Pq7mpTc7
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde31cd1-7be6-4924-fa0b-08defdd35d65
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17833.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:22:18.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oL3rknVlm9gXED6K2m/y8Ox46JcdAg/tNbgq2LF1IWSG1h+Uy4monpWb9shfb0pF/ZuDvnZEHdCxcfu56haVrPjDq0kKQLDBSCqfLtZeQ+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16438
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MCBTYWx0ZWRfXyOVd/VlTdD5D
 EbrdagfQlIj5GFrh0a0OdRj4I4rBjVovc1ljA82FS8rq+irUgf4cvQWYsJ1b6H+bgUPRpXiP4Ud
 mZdeqi9IaThxFqKCT+E06t6QfeEBuPdWKjP+OCeOg37Nk4IxZ8P0vg3OHKp91RCCiNDsGMGHL4s
 D7NR22LP1ykte7TvoWlRJ4qvWpGF+LR8QhOFJXwFKYq3jC360mPkXBpmwXr8cT0qSQpdcmQ4Yg5
 psT2vUovYrNTbRXPZpEveIsnL+zSTJdH0wFvUw14QWfX5rvhv9Lso52xGPPnWqWtWTJ2E3497mU
 vEaMFoMbsLvFUHkLzS2NCl+FeWcEZ1aWrR9thGrHesGAZTimuA2nHsdXifVDI1YSoEQBD50xQJi
 TNUrPyJQ4apO12AZS292WFVEnMyQXyR018FeVnu0NVW2Donad3QACX+OvfSv4s7DxKxjzY0OONX
 bmFMKfzBTMdcyUmjcIA==
X-Proofpoint-ORIG-GUID: jtgcAUcEcF3OlN5ldhsajAwJ7-PAUFu5
X-Proofpoint-GUID: jtgcAUcEcF3OlN5ldhsajAwJ7-PAUFu5
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=6a8575d0 cx=c_pps
 a=n6CzJEy3OCT3LO5pcrzoJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=XGr2FpfLDd2dUKU_94WB:22
 a=VwQbUJbxAAAA:8 a=m7A4B3WH8soo6Fkkj2kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MCBTYWx0ZWRfX0/qaORQon9kz
 Jxwm3LfbA/1mqU1d+cvw2/vQ4Bld+N7JE3uhUhX9UT+f5/NMf4rtiwigLzDc9BrlaE2cjyYfJ8q
 UNfIlDIYrOpyLyhueCNLHQ1j2V9Svagx5KR5IBmBM0/BS3FxqGig
X-Sony-Outbound-GUID: jtgcAUcEcF3OlN5ldhsajAwJ7-PAUFu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01

Dear Rob,

Thanks for confirming Sashiko's review.

On 8/12/2026 11:16 AM, Rob Herring wrote:
> On Thu, Aug 06, 2026 at 07:20:54AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [Medium] Missing reference to standard video interface devices schema forbids common camera properties.
> 
> Yes.

Added

allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#

>> - [Low] The `port` node does not explicitly require an `endpoint` child node.
> 
> No.
> 
>> - [Low] The fixed I2C address is not properly constrained to 0x1A.
> 
> Yes.

This was my mistake in the description. The IMX908 supports multiple I2C 
target addresses selected through the SLAMODE0 and SLAMODE1 pins, so the 
address is not fixed.

I changed the last line of the description to :

"The I2C target address is selected by the SLAMODE0 and SLAMODE1 pins."

and kept the existing reg definition.

Best Regards,

Lachlan



