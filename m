Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793387165;
	b=CVS90SAaoOdcEH6i6jjjW4bcz6KwLutk85lcXZ7Yk4+ShSItGyVYxAHXER5OWp9Ojr6D
	 hq6yVj7RFvTv0KnhEtiCv7EE5i9CC2V/dpE9RsylTLOaecoy5iLhiu5pg46qNHVFUF3oK
	 151V1qWCHuuL7buUkpkqvGnVGnAHMQ7cLBEkdQxHppAsy6wn0pZjxDegC8w6EYefW1Fln
	 NXg6ZdGZ8wqg3qAgZv2HCgF838tWqTDBpZZY+pBX0YZFzTIHmbw+qvR84ixzxVgzP+icJ
	 ZkUam5IwDaNRMz0dye9R07mxQR6OeLnmpxl94IZBgkVzq8xWw9QsBd+h3tzmd4XQkdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387165;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=jLnSSnbo0xp76+U9HBM/zJJ7vZhXOoIWzSduuCp0Jss=;
	b=wVbmUxDCH7+xYY9cWXxIb7rD0eSNgpXzyjHAx9AmpjxSXsrB2Z6xdqp93mudaqN1w88T
	 x3TKMpHjnklVq8ktOQDsIq2Pu9HFvMzzUjas17ugyzGabh8vv/L5PgwgPorybQ9yMuMze
	 PUMFBgDZKHF5L9l5PH2GroriamFUin66TVXpHKhjlWWadomIS+oIJVYcCCm2D1582ewJA
	 AfyOHf3JVuqvdDSO/wE4q8hyzSlK4u2YsdEyzPxsrdUE01fDljgYQqHxxk7DIesBPrB/M
	 emtI5T6eSr3uj33UlcyuBHyO5gfEqly6pPJKqrpkqToM8yQhJXEkt6/Z1FiLrFoPX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fHcdt11O;
	arc=fail smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD9606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 19:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAD9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fHcdt11O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793387164; x=1824923164;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Lpx4180ST2zWQJPO8X9vYwlJikWSKGSQcuERhzfzqG4=;
  b=fHcdt11OEL4SQwEVo5a6AaXJB1GffQBIMkl/AujJrNC55QiSyIv2aPgk
   QAOwTZvi18fakPJtC2I5LCDCqAUUW29db5/ddWVtR7AJvUY+MnzmRRcls
   wdu+Zlqv5egd+7pchWia5aNKgG6CGaojSWu7Ny9JG+zZCjMR/G+hB4mnM
   troobxm3G0fKFd3nJmiVaY2Bvsy3o02wc8rIimd4v72WvyYVZhwnZE1ON
   9XyrDpYPiU3w1xaYsJQImOGrU8S3MZr3TARlBPtoVYGoOhdaDKBOpVxOJ
   1TyDolUg5CfR1Agyo4wY6k9IrjtdCAJdlTz/ulEhMej7vPd3p0O4TO3e3
   Q==;
X-CSE-ConnectionGUID: QfPh97KXS5y1RULnDQwQBg==
X-CSE-MsgGUID: 6TtWTE06QoaW01xHqEhRVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2062765"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2062765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 12:06:04 -0700
X-CSE-ConnectionGUID: orCnGUSoTzWsyloarcPUmw==
X-CSE-MsgGUID: eNiCgTzTQTCqDGGiWbPI9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5651915"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 12:06:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 12:06:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 12:06:02 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 12:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+qaPWEDGsBcWV4kmF07m1IQf8ccz4LblARcN5B3sZWDHW8XvaCiOF4kLBOIjfNvoxnJVxJBEXrYvBTRLE77exfzNb6MNVtKR3gGrwwMVkCc95/uZ8sjeZ4UkxoOLNUDdS1Xj7idQW+FMU92Z11H0nLyEbRwi2ucD1EkaNOysnOkwcmGbVS6JCLtwmThprE1CKswHh1gK62x8VMu0nStjzDIHwzuqq8H6OVlCTgtohQPjMftuTZMe2pYG03BqJR7qqWpBqz3h3rUqB8otkOKrgS9RXX+P0Jc7YE5uen/CgpvyWCQ0GK7Lvj8/3ai+i+Zjs1E2Df3nLnS1Xpfl0zWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLnSSnbo0xp76+U9HBM/zJJ7vZhXOoIWzSduuCp0Jss=;
 b=lamcT0rEyjVH/Sr46/HlALGzy2odWSLQQcJpvxDiQW9chOVxQTV3GPIiTVB75IZDIEIESbxJrckQQQwAThHx0L8cmyDP9+/f24r8nXS77hyE6oX19zjhb8Wn4qoI+ksPemiEVbNNai/sbK2GSHNEMkGbtrXJ+D6Z6Jmsjjr8yDb5kA3JdSPDuCZ50L1jkEo3jlXIOOmcF7rDFOHwzM/o0FqsLdEZEDf5bWPJVVtjanbM0shKeSpq84uCturquLsx1Fk4TIwcuEhKSJVn8aGXsJsUrGKXR5Hq6684Y7KJ4Wyn9fOxvD+hLP7eZ7RbhseweO1LpAbBk2XE6uyIE5sTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8) by BL1PR11MB5953.namprd11.prod.outlook.com
 (2603:10b6:208:384::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 19:05:59 +0000
Received: from LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f]) by LV2PR11MB183078.namprd11.prod.outlook.com
 ([fe80::74b6:e45c:3f37:ff0f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 19:05:59 +0000
Message-ID: <0d0bce22-39f7-43a7-8138-e5fd3b27c82d@intel.com>
Date: Fri, 30 Oct 2026 12:05:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/cri: Implement Wa_14028586678
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261030173619.266260-1-daniel.charles@intel.com>
 <sashiko-outbox-191358@kernel.org>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <sashiko-outbox-191358@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To LV2PR11MB183078.namprd11.prod.outlook.com
 (2603:10b6:408:417::8)
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
X-MS-TrafficTypeDiagnostic: LV2PR11MB183078:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: c423d960-d534-42f7-a59f-08df36b8d5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|260925021311599003|260925021911599003|260925022911599003|4143699003|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3uFEeQdi4oEy2y19HXvzlX+hLPQRv+WIPPvzMZJ1AZgf25bng8iT3k0LjJspXrQQwFjhnoRKYSTxCVFCXqaEuGRoPsRalWUanmWbqzEs9d46YnHOCfxpDIKYuFtOtJYHh9QKdc43JNgC5PWOFP4qCuAfSQShNVNvW0QcxMQPfsmuFBvWz0cE/JB3zADuuDSUjc+9Z6ARt6rSNjTYwefOii1lYcJJFnW4BXCwVlWOnp2CXkfQ7uJ4jRgac/ItcBbu8Y8aoW0z1MYQC2uSamaSS8M8qf5A7DgrU9XTAewiMxjG/1Y1sXt4/TUEQnlamFxzc7De5UIR7D5SeV2YXy3/kuLyaiJzLKuglsHIJo5cx7HH37KOG2j2sqCQccTGaq9JMlTumZ1P/ttAkj3hIPNOTuagXPrV2hbmDFGekdmHntYF30LzYkDqbjSTFWwaPtM0ti+FqqJUuiXVmX94JzCe1nikAClIda4ICIGtc4J2aFJL4oekSleRv2TSFg5wufyBSn3UbGXML8P4b1mLrFbYVopzIvQZGZ5peGs1TrBPJ93E5gb0MBrHzN9sAtR4BFHblc3r2iwBiHBXGQfr6sMoDxdXl5ZmjgwB9XzOUMVmRi8lzZOq7Hxz+ijrH7loQYBYY7XRw4Y2wnynSGI2tHSzh5TmqhyHyBZfHI/3SYE0EKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB183078.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhnOHhHeG5vUGZTQ25iOVA1Wkk0T09lcGxtT3N2TlBYRUtzdUprY1Z5bExw?=
 =?utf-8?B?N284Yy8veC9FV2xzMGFJYlVXZldmUXhDTys5bzZIa1JsRzJWMFYwcWhtRnJz?=
 =?utf-8?B?UDRES0lFUWxudXJVckRSTi82Y1N4cFcyMk1FdWcxUmljaGFPcG9Dc3ZrWVV6?=
 =?utf-8?B?VjNHLzRtRkQ3SjdRYlkvbTAxMHZmVHZWaGdYQ2xKVGFqQWVhWElONk1BRnBP?=
 =?utf-8?B?dzQrd1JRUFhoeFNLQ3dBVmhldHdsLzdKTU9KZldwSzFiazRCV2xPN2wvWXlB?=
 =?utf-8?B?ZFJmSWxHZ25GQ01zbERFRzlsekFMYmFHWVEyeExuczZ6U044V3NvcmhGQnB5?=
 =?utf-8?B?U0NVTGU3YTA1Y1VFRW5udXYzQ2ZXK0F2WUNJV0ZVaEhwZ1pzaVhnbmNibWVh?=
 =?utf-8?B?YXgzcUZWcVUwMWJhRmxTalJjejJiODZneUU5RFJLcDZudGJzVmw4bFhJV2Rn?=
 =?utf-8?B?bk9XZjg0dklGUXAzTFRaNnh6aklCVUxaQVVKWGwyQVgwT3p3TlAxNUdGQ2pM?=
 =?utf-8?B?ZkpoQ2MzMnFJeSt6bmhDaFpCQUl5enNJV1hUMjhWWjJyaEdibzVIcWl6U3pj?=
 =?utf-8?B?MGY3TkEwMXU4eDdER2N1Zy9lTXVPSHNsUy9rZkE1Y205SVBieFJDRGtyV2FU?=
 =?utf-8?B?dVFxaTJMN1BFRlR2Um43OVpkWHRuMk5UbmV4Y3h0b2lseWZGdUNrY2x1VVkv?=
 =?utf-8?B?Wk5IVkg5ZkRhYmhXNC9iUlJXcUlDTFhGbWdYYXBZS00vV0ZYeWV0VkhXVHht?=
 =?utf-8?B?ZFI1WEwzRFgwK09wSk4zbisxb1lVNzN4cDdNRk1PNzM4OVF1OElZdUZsM2Mw?=
 =?utf-8?B?TE9tdXJyc2NTWlVYYlFLdWFiRFNpWEN0UlFxZWdEWGRGQ3JBYnRTQjhSTDFp?=
 =?utf-8?B?dGJDYVJDeUVBS21FS2lZNlJnTURKeUVFV253Y1Z2QlQ4R1Azc2JaMXhOQjNv?=
 =?utf-8?B?REtmaE5vOFl5RmZzdFJ2WWZmZUlab3BZRjFZcmxIMFkvWE1TTEYxM0dsTXFU?=
 =?utf-8?B?N2ROVmVXS3dydzNpV1NnOGRkZ0RZNzR1eVJ1YWFwY0RXWDVlajZTczdESVly?=
 =?utf-8?B?T3Nka08vbzN1YVhtbkNkaTkwTUdLdTd2RExwN1ZsR2RUWmU3TlV5c2lpeWJs?=
 =?utf-8?B?d253SVRXRGRuak1ERE9jN2Z6K0V0ZWkvcDg2RHoxNXVFN2k4ckRKN0pjYTFJ?=
 =?utf-8?B?cGEvZjVGZ0h4cElCTUlUaW5tYXBOMnB1dnNuMHpsbDMrQWxieEp0SFU1QzNz?=
 =?utf-8?B?T0o4aWxsd3UrL1Rib3kvcEw1UmxDYjRrWDZxY2hTS3kzcDAwaGZmakhvdnEx?=
 =?utf-8?B?TDYvL1k3VEZNdWNINCtSaHlyWUxKMnlOT2todU5SVS9vVjFDZ2Z4RkV6aVJj?=
 =?utf-8?B?V1JSR3B2cWNRSVduczllckhkZkw1N2hYM1FaWVBta3R4cm1VYU11V21scllC?=
 =?utf-8?B?c0YwakNIVlUxYXVXRm1LZ1pqQ0ZZYXU3cmdtYXFKSE83TmJYT1RlVXpCNTNN?=
 =?utf-8?B?YVljNkhFbVZtdnFwcGRNeTJOYU8vaVN1ZWVjNGxUblZ6R2c2b3pLV0xOVmFy?=
 =?utf-8?B?OW40ZmlzcjZ5Qm4rQmttaEpZRXF2bWRhK0dDQTc0bTN5ZThNamxHNjhGeHN1?=
 =?utf-8?B?S1ltcUFmU1YvdDAySmk2UG5idk96RFZXa1VXN0dMU25uNng0RGxxQWdSb25q?=
 =?utf-8?B?UHFQZXVIQUF3dmtpSWhQYWVQMXBUaWFrOFdFcHZ5eVJ4VmhTa1FwQ01lQnly?=
 =?utf-8?B?eFJaaTgrL3Q4TkhPQkxpRTllaU1JMHVoRlZlN3lzWldIc0VqZUdmWnpNM3RI?=
 =?utf-8?B?MWdRRk90bG9lSzNVMzdFenZrTWIrOFBLcmRwUmdsNHppMXRXUDlYcHJSYXhB?=
 =?utf-8?B?K2FkWDlsSk1Ga2xvNjFRZ0trNjBFTWhtQ1dzZ2Vjb0pnNk1EMnJxN0NkRFh5?=
 =?utf-8?B?UURrc0pYLzY4K0FwY25ISlozVW9PcWovV1B1cUFWdHh5ZTRFTFV6SHB3a0lx?=
 =?utf-8?B?ek5idlpEL2VoLzJDMWE4NG52eE5nWXlpWXQ4TWQ3b2VyNEdJTzZrU1QrOVNh?=
 =?utf-8?B?cFdnSm40dmFsN241MFVBYUtWTERxK3R3RGVnNi9XL2FJSTJkUTNFNnBCMkFH?=
 =?utf-8?B?cDd6RGM2SkVQYzcyaVl0QWFDYnBmWmR2cDVrY21zYzBseVpWcHlrVVpFMHpv?=
 =?utf-8?B?T3IvdXM0REFyUHpyZ3BMNDhxMXBTYzFtdHhvZlE4c2hiNktzSFNzS3Uvbkl4?=
 =?utf-8?B?dWFzMDI1c1c4M2pyOU56SEdFRVhGYTB2TGdEb1lhcXBwMWZVNElzaGFtMGFp?=
 =?utf-8?B?aG1vSlBCOWdGY21xZ2dpaEpKREZ3VXY3QkZQdzgwbE8vN0FKbzkwQT09?=
X-Exchange-RoutingPolicyChecked: zztLga9w6tXrKieBbiL2l3J3auSSdCVAlyR7r42I3P9gDpvUe/q/Dra9sZbkBHXblfMilh0MrEoGMYYIn5l9b5Ro2HSuoGh6FUCwT3mLt3K+EBXyCY7H7QJKC4/TfFsBnJvInFaQN5ATcrPvYl58znfnkfXIlCUK2e851nZFaWNVd/arc/1gEk4Ahx8XrRT3BBxuLANZIrOoUUPq6HwkoQfXCS9N/iycGxMASKEmHwcxUoqhlE1xEC3OStLB28Mi274ZHaNilLfFnmFUAYD8X9j7j3oHclR8HssT9ODiU1sFNUb6pBM82tYxYKAzCfm3yGsOyeK4SVy8PeuStBrovQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c423d960-d534-42f7-a59f-08df36b8d5bc
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB183078.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:05:59.8309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kTLJUZgrx6WFMjPJibEACz45kHlX0Wjvrk2yIDmAcg2+B3eT/39guIRPQtPHnxoKFpRPdqXNQThOJ7cHUhWtWyPkspL8KKv1FcIEqYLARc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
X-OriginatorOrg: intel.com


On 10/30/2026 10:49 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/xe: xe_wa_apply_tile_workarounds() runs before xe_pcode_ready() on resume
> --
>
> commit 3d1f950d0d5e813299acdbeedeb799005ea2bb7c
> Author: Fei Yang <fei.yang@intel.com>
>
> drm/xe/cri: Implement Wa_14028586678
>
> This commit implements hardware workaround Wa_14028586678 on Crescent
> Island by updating DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS in
> xe_wa_apply_tile_workarounds() and calling xe_wa_apply_tile_workarounds()
> on runtime D3cold resume.
>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 5a562d8daeb94..d4f93de368fc4 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>    */
>>   int xe_pm_runtime_resume(struct xe_device *xe)
>>   {
>> +	struct xe_tile *tile;
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   	int err = 0;
>> @@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   		if (err)
>>   			goto out;
>>   
>> +		for_each_tile(tile, xe, id)
>> +			xe_wa_apply_tile_workarounds(tile);
>> +
> [Severity: Medium]
> In xe_pm_runtime_resume(), xe_wa_apply_tile_workarounds() is called after
> xe_pcode_ready(xe, true).
>
> However, in the system resume path in drivers/gpu/drm/xe/xe_pm.c,
> xe_pm_resume() calls xe_wa_apply_tile_workarounds() before
> xe_pcode_ready(xe, true):
>
> drivers/gpu/drm/xe/xe_pm.c:xe_pm_resume() {
> 	...
> 	for_each_tile(tile, xe, id)
> 		xe_wa_apply_tile_workarounds(tile);
>
> 	err = xe_pcode_ready(xe, true);
> 	if (err)
> 		return err;
> 	...
> }
>
> As noted in xe_device_probe_early() in drivers/gpu/drm/xe/xe_device.c:
>
> 	/*
> 	 * Check for pcode uncore_init status to confirm if the SoC
> 	 * initialization is complete. Until done, any MMIO or lmem access from
> 	 * the driver will be blocked
> 	 */
> 	err = xe_pcode_probe_early(xe);
>
> When resuming from system suspend, can the MMIO read-modify-write to
> DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS in xe_wa_apply_tile_workarounds() run
> before PCODE SoC initialization has completed and while MMIO access is
> still blocked, leaving Wa_14028586678 unapplied or corrupting other fields
> of the register?
>
> Should xe_pm_resume() also wait for xe_pcode_ready(xe, true) before calling
> xe_wa_apply_tile_workarounds()?
I'll move it after xe_pcode_ready(xe, true)
>
