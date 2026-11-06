Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793946805;
	b=bFhW85d/TQHfO9+UiTi6W9vASP9VpOOdyGRREDdetOCKhZb/BhJpD0A9qYmLBlbjTdFM
	 dEtvJHhri16qivpSPg+b2cPZAchFncv4WQX8lrvDhuvhOIZveq9MObgihzV+9wAguIacC
	 nC5k3P272ASMVLHa/xC0u8He8lA4x8cRsseVrY/sEti1yU/Stk4SUrOiaucKb1Kd+P0o2
	 QZyqRJmK4k60d+tYYCCDI7KDORXwUWsIj2+CBFSmu1hLrAGLKK8dlghSAc1matfPieRbY
	 LRAJeejaic+7i+lT26CjfppPXhnak5zI0eh6MUR/X/LCe8i4QA0AIZI+oQ6iul0+fIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946805;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vNVs6i3cY3ojfu3UYK1bwXO9RYXu1EamtFPpkeDb6fM=;
	b=no7g8gCZ0ZOt/0Of3WteW+b+cREuHj00OsnthFbuRZ1Coy3YAXGcRw8zv2atnT44ZyW0
	 7/7B87Fj6SYUQp8YkOy01xjMDmipaBARHCqZ2CaeoAQUTVw3Ed2b4UUJpdaZAhvoYJKIE
	 9SX9ZaWc4BvlVikHzp02iZ0Dn5HsZOz3ulyqRHvBhxiuD2g62qej1APS6JBUJKsAGKDbL
	 0ggArwrd5RoUDtU3qD9zVH1TtUp8dy8XQF6dpXEE4kgta46+GHxcGpr37eHMbMmsz9AFH
	 gHUVy8/Bz6b+8Ry96+RHua7Ak5w3asTXfF2wEuXeFS3gpeSmLHcAoBekAfoKN7/HCYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mcgcsd+e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.27
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D062E606A326
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 06:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D062E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mcgcsd+e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyztDK6T9a1HZLv5hX26eGnXoMqnY7Irwxh+/7era/DJi/nQ3QPymn4FO07adw2vJTVAaMmkcAkt1FFQO0GVeKSoYMGLesOcpZ6p6MftYTjTdjoCkChDqOw4EjAgK98Jduxcf0qg0fwbDa45HzhJKH5i+8uG+jlRWTp5cIvJN+/YAPgT7YaWEovX9r/A7lCw3cJR7YDdpwwuAGgxnlZoJnfA+JaZjsWOcFkdFH/OjCNnZxL29f21mG8TPqWbpoUlPGgJKTL/ewwQGVX1U7rDFPiZmYIIot+vtCiaILo0gtJFHhaxAC5gQ/MYCxVVyL2xjqXyoOqMy7zq6WUEPuJ+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNVs6i3cY3ojfu3UYK1bwXO9RYXu1EamtFPpkeDb6fM=;
 b=mun6q/43pFwfAsBxLSu85UyMvwbGhwOlGGkqOqdttv28RtRfPRtr1jVwI4GL7UBcICedscfKWd5UZrVZL7bRl+xK3zxPjBujWhy4BtQns13GuK4h9qPaAl2GVlxER4dIo1a9U8J0jsSejn/KSW0WMp0+MllYlxO7nGRJgyXyTvCkNO4DaEZGu8X4e6BfDlJ7HesJzWIF/ZQN0/9gwFXWr7gvES14lZJQj7PezfyI/zwSZuPH0Q1dES2DrOah9F+Cv1xAkg9B71A5+xunKyVg5GxyH/L4dQ+A8TnU1K3Y4YDc5fgDh74aKubhMF9rS8jajRvPR/YIKjA0bU9kfjrWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNVs6i3cY3ojfu3UYK1bwXO9RYXu1EamtFPpkeDb6fM=;
 b=mcgcsd+e5VxxmaC6txHyuonirys7HrU9f0D1+r6Husr1MmlxQ9J4ozp/FWJ/YNai6C101dkb3oe6pSsmjFoJq63I+CcEkG7ErcQRs96X2zVO3mUzqJNWwW5PegQ0UxEKnl1M/Isjeg9kplHB2U6rJ6B/Hihh1RMDyk4VeJpbHC4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 by IA0PR12MB8976.namprd12.prod.outlook.com (2603:10b6:208:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 06:33:19 +0000
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69]) by SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69%4]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 06:33:19 +0000
Message-ID: <daaec067-4628-4b2b-b7a1-a2a7fc8de843@amd.com>
Date: Fri, 6 Nov 2026 12:03:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
 <sashiko-outbox-198746@kernel.org>
 <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To SJ0PR12MB6942.namprd12.prod.outlook.com
 (2603:10b6:a03:449::13)
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
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6942:EE_|IA0PR12MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b39c36e-1916-4fa2-9ed4-08df3bcfd8cb
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261102123227099003|4143699003|11063799006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|56012099006|261022105027099003|261021121427099003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3NLTYF+KNXc+iEsOTXRgSgPZTXDKPcgmgRGR1nBRaTUS3xXulcjnp4QjgM2dwZmESxb127NCz8PFj8eE/CByz9w5zdCdmwTFcnN6qWPHga94P6aUFnoKMinYjVSCdKgLv1MBdWxjrF19Muh2HeJPTuTjMcY3jUKsZQJIaTztJWoqxtfXe5g07TZgeZ6yTnEyPPfyw4sclvBvp3Ej/kmvc3xT4cuzR6j1BXizvmwGqMoIbI6nO59Cbr9ZFiy3Qf5VD4u+d2MqK3lpwlfIjoJohPG/57M+9cdDDtZoV+HALJ+DXpogUdKnkxgGzWFeZaO5P6ZE4Dvbl0SSpebeI2M1hpVCAkenU+Tq0/cnuvCsM4dd1OFLhqur1eMQmmZjMkpTpseLzKUCa/eC13nFyJWGuHk8DDORx73W/X/W6t7q+FYleCqGwExjTd2af54wV8nKiL0N21u7v7IfoGhdKMgg3oeEzwiPVMFrlFcIk8P2k/T8vGHsSu7IJ49p8BUoczaiYQrwIxyia0pBSR+YeW1w+Slum9NGly1icWiyFxw7Me9g8fyix3BWqRgywbBqAewAeSxP8ZwQRPpkg/3YIbJQ88xSM51SfUfgKaPmOn9P4eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6942.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(4143699003)(11063799006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(56012099006)(261022105027099003)(261021121427099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mml5UzhHYmw1TEcvN3RwRTdoZ0s2dnFhcjg3NE1VWGN5dWRqUE4xdHEzQUtI?=
 =?utf-8?B?WGpwWnRtbmRoa2k4Rk9CZ1V0K0IvKzExeFNXb1hSUEVMb0ZkQnRuYlNETytO?=
 =?utf-8?B?M1hDSU4vM0dpVlpueTNCL0hQWTEzZ0FCNHI4b0M3U0k1bitMVkdrWjUxMG1m?=
 =?utf-8?B?TWpUbldSYnU5dzF2ODJWMGlmd1N6K2lNcGFwL2hzd2c3dC9tczR2dkpzTU9t?=
 =?utf-8?B?OGFLYUZaNFIwNkd3NzBxOFBRL0hTUFByd2JpK05TOVkrUG9QcVlvUm5Yd01q?=
 =?utf-8?B?Qk9hV3dqRGQyVGlodDRBQ1RiNDlZOGJKYVlOYkV1N2szZzcyYnhiaDR0YjZ5?=
 =?utf-8?B?OU5hQXVJNGxkV1VEejQ5QTdScnBodzFMblF0VUcvSXFTMVBaVDZ4aDZ2cUdj?=
 =?utf-8?B?TW4vN3RVUEJlbjR3ZENLVFc0aC81djcrZERGOWNJVVR0U2ZQR2xVbk9zakYr?=
 =?utf-8?B?bHd0VGIyVXZTbmwrTTVscktEY0pIS1BqaGtleEpnOWxuMGZsdHpKczhMbEJC?=
 =?utf-8?B?VnVTY3BvUGc2YzY0d1ZIazlEK2szOFFBVzJ1VEkxN2hUV2xwUWhSSGRWOTlk?=
 =?utf-8?B?Y0Fseno2anR0aE1wYzA0TVlIWWwrdTZuSzNiNGcvQkk0TWtDZlVzSEdHNVJy?=
 =?utf-8?B?b1BueGtBZktmUFVRaU1qQWx5TTNYbmZVOEp6TFppbndFNlJlaUdZSmNUN0tn?=
 =?utf-8?B?aU8xOEZxbEZHdnlqQjRvNHA1RC85c290WEtTTlU0UmZ4Z2V0eEJtd1k5UVYr?=
 =?utf-8?B?T0xIL29KTjNSMGordGhEK2ptYWNtNlNlK1ZKemNyUmZnSDFsZnBlYXM2U1ZO?=
 =?utf-8?B?dDNBbVF2MlpVZlVDaEdGQ0RGT092TTJubi91cnlzKzhWK0phS2kyMGlGNk9u?=
 =?utf-8?B?ZFQ0OTZieHBsOGNvdm1nTHlIOWZNaUhYWXpreHZTcS9Mc2hvSlFxK3orazBH?=
 =?utf-8?B?WmN3YS9VWUI4aGk4VUtUNk5nZTJKTENOZlpzSnpTVmhjbG9WMis5RHdKRXVI?=
 =?utf-8?B?OWxuZGkyaEhjZW15YyswUGdvSWJxZ3g2NTF3YlB0aFJ5aFpFbEpFNEFFVHdF?=
 =?utf-8?B?cVVkMkJXSk13REF6WlhjVXJ4emVxL3V6YVZidVoxeVJXZmZSb0tDNGJLUURo?=
 =?utf-8?B?VzNiOCs4MS9GQWw0L3VUcXdvLzZBb3JGM1AwcU1Tenh1Wkw4ajZISE0zMHZ4?=
 =?utf-8?B?RHlhcDRRRWI4MGJPZDRsSXB5NVBjVitDZk1yZjBNWktRc3k5WUg4b01Lck5a?=
 =?utf-8?B?Mm54TGxwUldNQWQ0REhCQzRRODBSRlRnSG9ZMkZNUVpSN0xscktJb3lZUFpD?=
 =?utf-8?B?WGwvQkZlL3BxYmI4WTZsU09PVnRBU1RONWM4N25mSzEvVnJsdnBieWhEaFNF?=
 =?utf-8?B?U1lxbHBDbEhLMzJUclIvMEZ3bU5VN0ZPWWJwY0cvemtzclBXSG00ZWRqaW1X?=
 =?utf-8?B?YTQ1UTMxc1R1enNqOW1rbHBjd2dhbnVUajgxMENONUhYdzc5bFNXWDduOHdU?=
 =?utf-8?B?YklrUmZTQklwQTlid3NSTVl6RGFmNER0UjdhblhOelhuSERueGZ1YWxRRUpG?=
 =?utf-8?B?T0hRY2JpWnMydWloMURVTVBleE1nMzIrUnlva2kvVEJzWndGNE9aVC8rNkli?=
 =?utf-8?B?ZDA1d1EvRVFoMmZrbW5nYWNSb3B0WGMyUk1RYVh4Nkk2OHpPRWtoRUlJRmRl?=
 =?utf-8?B?YXp4ZGlteFpnM3NkRnM1ZU5ENXNwN2UycUVkeFh4RU5lRVd1T2RRa3FKUGxE?=
 =?utf-8?B?ZWJ2MXRBMVNDM2N3U2tmVnhrZVh0bWdCM1JuUGN2YlBaT29sV095NUl3L3dX?=
 =?utf-8?B?eTdpZnFrQmV1Nm00ZWpkbm9xR3pJNTRwQXVjWWo2TVpxZEpBOEJxeWFMVUh2?=
 =?utf-8?B?aTlxNHlYRDM2VGplWXFRbStmb1ZIa3dSNGI5VmYxYWNKRCs3MFIydjcraGRO?=
 =?utf-8?B?VGVVbjBheTlZTW8zQ2hMdWtkMEdXcVlXUllIU29ZZGVaUHFlOHJVZ2JES21P?=
 =?utf-8?B?Qk1kdm90aHBOMGhQVnlkSHBVcHYzNzZTU0RMeFJReGdENXNyeDlqaHY3Zksr?=
 =?utf-8?B?ZVMvcVlIZ0hEeFY2MGtmSGtObGRnWUl6Y2o4blR2SzNzaWRmQmR0V2VQQXIy?=
 =?utf-8?B?TlFMUStFbmVLSEx5eWdPRWh0bHZDcVFwK0dXVjc4RWpkOUVaS0h2MDdFTTBq?=
 =?utf-8?B?a0NTcmFoaHNFUDQyc1BsZzlmanA3bkxXWmw1MHFiWTRGMUtvYVlnODVUWmVW?=
 =?utf-8?B?NkdlTE1BdHhUVTZMOTlsTE5DbzZoc0hFT3h4K2RYK1NLeU9UeUVRcHBrYkcr?=
 =?utf-8?B?TncwNXZ3Z1NvcG9VU3U4MEpOcUpHaFNVRlNjQ0hoWlRqTmhQTktQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b39c36e-1916-4fa2-9ed4-08df3bcfd8cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6942.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:33:19.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N/Nxfypj2uQAeKvbXxTDRoVO1JFWmRk2XixDhYayLzoAzr4HoespZZUebGA/hdTGzryhdpxiPll44PHflbAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8976



On 11/6/2026 3:39 AM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, Nov 05, 2026 at 09:01:14AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] i3c: dw: u8 truncation of rxfifodepth in dw_i3c_common_probe()
>> --
>>
>> commit c93cc6843b57993d053db03cc3f7cee25dbd4371
>> Author: Shubham Patil <shubhamsanjay.patil@amd.com>
>>
>> i3c: dw: Track the transmit and receive buffer depths separately
>>
>> This commit splits caps.datafifodepth into caps.txfifodepth and
>> caps.rxfifodepth, populates caps.rxfifodepth from the QUEUE_SIZE_CAPABILITY
>> register, and exposes the FIFO capacities via base.tx_fifo_bytes and
>> base.rx_fifo_bytes.
>>
>>> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
>>> index d1119f203d1b6..dd5462b129514 100644
>>> --- a/drivers/i3c/master/dw-i3c-master.c
>>> +++ b/drivers/i3c/master/dw-i3c-master.c
>>> @@ -203,7 +203,10 @@
>>>   #define BUS_IDLE_TIMING                    0xd8
>>>   #define I3C_VER_ID                 0xe0
>>>   #define I3C_VER_TYPE                       0xe4
>>> -#define EXTENDED_CAPABILITY                0xe8
>>> +#define QUEUE_SIZE_CAPABILITY              0xe8
>>> +#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)    (((x) & GENMASK(7, 4)) >> 4)
>>> +/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
>>> +#define QUEUE_SIZE_TO_DWORDS(x)            (2U << (x))
>>>   #define SLAVE_CONFIG                       0xec
>>>
>>>   #define DYN_ADDR_LO_MASK GENMASK(4, 0)
>>> @@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>>>                      ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
>>>      }
>>>
>>> -   if (ntxwords > master->caps.datafifodepth ||
>>> -       nrxwords > master->caps.datafifodepth)
>>> +   if (ntxwords > master->caps.txfifodepth ||
>>> +       nrxwords > master->caps.rxfifodepth)
>>>              return -EOPNOTSUPP;
>>>
>>>      struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
>>> @@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>>>                      ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
>>>      }
>>>
>>> -   if (ntxwords > master->caps.datafifodepth ||
>>> -       nrxwords > master->caps.datafifodepth)
>>> +   if (ntxwords > master->caps.txfifodepth ||
>>> +       nrxwords > master->caps.rxfifodepth)
>>>              return -EOPNOTSUPP;
>>>
>>>      struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
>>> @@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>>>      master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
>>>
>>>      ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
>>> -   master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
>>> +   master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
>>> +
>>> +   ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
>>> +   master->caps.rxfifodepth =
>>> +           QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(ret));
>>> +
>>> +   master->base.tx_fifo_bytes = master->caps.txfifodepth * 4;
>>> +   master->base.rx_fifo_bytes = master->caps.rxfifodepth * 4;
>>>
>>>      ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
>>>      master->datstartaddr = ret;
>>> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
>>> index f5b4491b247a0..e23554bfc5e49 100644
>>> --- a/drivers/i3c/master/dw-i3c-master.h
>>> +++ b/drivers/i3c/master/dw-i3c-master.h
>>> @@ -14,7 +14,8 @@
>>>
>>>   struct dw_i3c_master_caps {
>>>      u8 cmdfifodepth;
>>> -   u8 datafifodepth;
>>> +   u8 txfifodepth;
>>> +   u8 rxfifodepth;
>>
>> [Severity: High]
>> Can master->caps.rxfifodepth overflow u8 and truncate to 0 in
>> dw_i3c_common_probe()?
>>
>> In the DesignWare I3C controller, QUEUE_SIZE_CAPABILITY_RX_BUF(ret) can
>> return up to 0x7 (256 32-bit words, or 1024 bytes). When that happens,
>> QUEUE_SIZE_TO_DWORDS(7) evaluates to 256 (0x100), which truncates to 0 when
>> stored into the u8 rxfifodepth field in struct dw_i3c_master_caps.
>>
>> With master->caps.rxfifodepth set to 0, master->base.rx_fifo_bytes also
>> becomes 0 in dw_i3c_common_probe(), and the nrxwords >
>> master->caps.rxfifodepth check in both dw_i3c_master_i3c_xfers() and
>> dw_i3c_master_i2c_xfers() will reject every non-empty read transfer with
>> -EOPNOTSUPP.
>>
>> Should rxfifodepth (and txfifodepth) in struct dw_i3c_master_caps be u16
>> instead of u8?
> 
> Make sense, please fix it.

  I checked the DesignWare I3C databook, section 11.1.58
   (QUEUE_SIZE_CAPABILITY). RX_BUF_SIZE is in bits [7:4], and the
   documented encodings are 0x0 through 0x5, representing 2 through
   64 DWORDs.

   These documented depths fit in u8. The overflow example requires
   encoding 0x7, which is not listed in this section.

> 
> Frank
> 
>>
>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261105085425.3418230-1-shubhamsanjay.patil@amd.com?part=2

