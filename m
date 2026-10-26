Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793016876;
	b=RycRkrLjIELcJFzetg+a64Goa5hCYjMGjnWV/a1+nVODqKPPnVYZnpOjgkRN6f82wmer
	 4YU4MHsxkrR1YFZkZu3A/3x5vZ+kTxvPXD/vhR/vgUknEB6rSq1zQXVOOLFYNcZc4flcq
	 MU9ncOD8ZHz1K6MJenIe+zyfJrrTCqt84o85f76aLeeBPzodcMfm7Z/3bEJHsqyUuGY6O
	 +6KRCqPGu4laISqQPf7Ezd+PTXNGSRacniqU3Sm8iifLZvEmL4P4crduJiOiz7pwUbBzs
	 je9alW/bf+7bVoV4voSh/t6hGg3QsvEahW4DfFBeRk5PzqLa+w3Z1Lls6/lXv9BJoAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016876;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=9wHcZu62I0kkrj2e8iItaHyttpo7ij9vwzgF+LvPwW0=;
	b=2s4WCWTnBr+K3OpBF/PYDq7azpsOYg+8oP4UN+3BenaGip4+MhV7Ezxzgm6cLBRBsI1/
	 RpH2oMI9ugnWhYjpZmAQFzXjrxm8PKPDa+PCXPUVmWXvIPxbJa+gLzhLgmv63DWHhrd+P
	 Oe01UEPpThGZr5HU58PJYqaug9XQUUUfFWIO5YsxdKzCf4uOI+bUvHR8vAr/2HvqE4eS7
	 /huTQVGzXQI13gCZNw3M9n9pm7r7oOp0ZuIq//mnFc/s9tEbVCLeQz9UmgMn4Hplnugzp
	 2bWG2TgaqpDHE0DfDkl2U7Hnv8S1CbAyvaPOk7jROuz204SwGawKX5WAnMSTOpb44Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NYmOstZD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77902606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 12:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77902606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NYmOstZD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh9bjQAqEMVWCyyum444pkQWHJmpbFJFZNpAlQA5yj2Mdz4D1SkKuapeUXHAYJ/g5GjtlKMdY1Vi8WZ1b85fyE6L+KXLxgbGa1GHudffJdgfCHDqJyEruEeoT3fo9uo8TYot8QJQWQhJ2Xb9qtJDpvVVb6eTkKNZ3p7r5tj1smx6dv6c8YhwQrjHHVAq2/VRrX7wc+wK2ktVNt6+yc9qjVN2Wk4dCk4MC5PfPjl1wD/xbIWEvi3Z8KcWvQEaQW7veVkWtRi+n108N0Cpcw5OqtpnfvEHecrgVgRp5BuHIKTUMz7RyDHdZ/zm32tvWirIIQftsdjiuPNsMGWdiRuOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wHcZu62I0kkrj2e8iItaHyttpo7ij9vwzgF+LvPwW0=;
 b=RwQgjY4eGgGPHOqQ8bR/XrIIHNtsGcCYacVWcA9X4yohuZy0JeNeNt0ha2vcWiRQrgvnXIKJ3e7+obHSy6mQM4aXJaUG/LzIb66GipBiXT59JnAz5SrdGlnMhB7SHy4dkFRwH7Ts/ZzzpKgI4cxmTezAY5LiBYfyctP+3y6DfXGLzh1hbWXd09PmT+hJGILX6xONEj8Ei7T1kSm8pRnUDNdnNiNuXT7R837A6Q/NWHiQbmpF1LkbUK6PO/4XUefqKbrWxqQ7H25t5x8wktpvQdpE/etMiOdmGjDZ0yORcT+59h56pyBCxmne6vOjBBEMEZeSPvhfVafEzv0kZG6XIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wHcZu62I0kkrj2e8iItaHyttpo7ij9vwzgF+LvPwW0=;
 b=NYmOstZDhUbt7QGCVgEEVRDSBhZ8eP74Tbp6LJOG1ehqjdnZXhYQPIDqUBKp9F64l9ncw738VXp1i9godX33m/ozHePOBhCMf8w2jGV7PTeMD5JB4+3XC9/ZHEiS1/CHFQ8ZBKS6K7FCg20oipehZlRG4NAbSrRbq20fu5wRS+4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by EAYPR12MB999133.namprd12.prod.outlook.com (2603:10b6:303:2c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:14:32 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:14:32 +0000
Message-ID: <b9a63395-16f0-46ee-9208-19b3b28d876c@amd.com>
Date: Mon, 26 Oct 2026 17:43:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] soundwire: amd: return response on IMM status
 cleanup timeout
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 "N, Poojitha" <Poojitha.N@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-3-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184738@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-184738@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYPR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b7::8) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|EAYPR12MB999133:EE_
X-MS-Office365-Filtering-Correlation-Id: 4543de07-068f-4fa0-1bd7-08df335ab0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|261021121427099003|10067099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	v+Hm2lJ3LK0OLa0d0D4alvLOefBh7uEHbDqeM97fZXVGyWD2kVmFsHfTu4onytjW2a4ihE/XnDbHhm3nc+cRgADt/p49NFEKQVyKI+eOkIITlq1wR0YlFutfOMdnDwHbqeTYwXDWlFftKp8y54rbmv3XpGD7UuDJc9S0LNQQ2bsZLS0EjdAI4JsS+qSUDtOvlJ/oIYbxO/bwHuFqJsN03nxxux+LaEiRx+BCUZedlQYDLqG4CuPzw13Iibi4sjPA2FxwGQ7fL0Q3JUtfggnxJg5Rpapyp93CqHwM0AUY920V4GfLY7gBvAn8EQsvcjCdGYDA6JIbt7mQ6kPd3dWsam1fZ/sKdzlYvCMqYrGKp2gcJXWBSlqyhV+ueQ3HF9WPoG7rO48HS83iJjbwy2+F3Y/3Dq7JiHxHsHJ2lE0Nu2VppIHM13YMYvurh4nUmDFfgmtp2WdYm2EPT+Hk7k5Y+7HlI2kTlACzU0AyTZwyYne5vYbDCqpjKA/Ok69w5qQEtho+HdcZR+v5O6M+qw8x4Ng13xq6/BCmLk6G3bzZZgskZCuGvkqdgmYVQYEl0sXs6u9boqq82csXJVooPXbOZlxCHQCjqtXCAz5XMxjSqTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNDWGNTMUsvRSt4Uy9wZXRLTjA1TFR2Wmw0eDVKT3ZSV1A2cVp1T2ZNZzJB?=
 =?utf-8?B?bExTbGJmZVZGdHBlR1hlNGdDaW90ZVRJOFNFZXhJUjk1S0dQWHVTQitaODJz?=
 =?utf-8?B?b1lEeDhPY201ZkorTEo2ekpnSWpZdlZxMEhKMU80eHgvQ1lGMlRoRFdPcVk5?=
 =?utf-8?B?bG9uN1RVUW9FZUhFdWg5R3ZDT0JtR1VnbkZnNzJzZHZnekRZTUVOSU9va1R3?=
 =?utf-8?B?MlVRV3Z2M1l3cFJXOHMvbllZNU8vR1BNZ2thVXM3VDdXaFBFWWxmUWdNVkl2?=
 =?utf-8?B?SkV5amJuazl0ZnkxZUxoeklCYjhRaEM1QkNlTFYxWS81NithUzdvUzNnVXRB?=
 =?utf-8?B?UjBEWWp4dWwwbHVscTRTSXBydmMya1lETzVXSG9vSExJajlJR0gyT25PY3d2?=
 =?utf-8?B?ZFlKOGRjRGdsL1hHeERKejF1VFhWSUQvV0FJRm1ialZPZ2JrRzlob2NxTjhr?=
 =?utf-8?B?WU5WNVV4WFplRE44cjh5ZzlGK2hURWgySFBBalFHY2pUVXhQU01nRGxJdE80?=
 =?utf-8?B?YjVac0tQRkRYajVySnZ1NlA3YS9OcVJRYzRFN0E0WWlOZ09tUmNLQzVPdE9E?=
 =?utf-8?B?R3k4bEpPVmxFUm5OUkRKMVJhK0NBU2FYUFVaOElnSi9TR1M3Z1FtVVNDQVdm?=
 =?utf-8?B?TkhuKzFwOGhvc0Y5cWRPVGt5NGdtV1JuTmhtSExFckZuL1Y2YWRYZzRIdlZ6?=
 =?utf-8?B?ZllTR1hHTXZ3MTZxdnh2OW5sWHNZRTRiNFZhaFE5em8wYVNUdU5RY1lhcVc0?=
 =?utf-8?B?SnpwWHJNaXB2VXI0UmlNUkV4QWQyNGd0SjIyb0hLYy9uYmhEMlNoK251b1M5?=
 =?utf-8?B?VUhlUWNpWXl5MnhYUTBIVDlaUmhScXBkaHlUK2xxbkF0QjMwb0kvUERCQUti?=
 =?utf-8?B?R0Q2MTJYZFJsVklBTkZ6ckRGMmZyRWlsSlh1YkhSeFpLMVVPeVcvd0k0RlJk?=
 =?utf-8?B?Mm02a1d3MmdxcjNrOFNVb0p1NElCRlZrYXdEb0tCNXFaQVZvRHBqei9SOE4r?=
 =?utf-8?B?cTk3Z0E2SHFobWg2TGN3dk93aHUzcnVRdzRmemcrT01VT0J0c3VTZEZvSE03?=
 =?utf-8?B?TElscUtrSHA4cTV3RDVOckJXUXZod2VpUEdObUdTWlZKTklqZ2JVM2lBaTVy?=
 =?utf-8?B?d2YzeGNtVTU0QWUvU2t5SXJPWnB4ZytZZXJGdUh2VTFsWDMvdGhQaWRUd1ZR?=
 =?utf-8?B?MXFRTkRlMDdtRHplUTRQM0FEUXpHejZsMUtjL3J2aFd3ZmduV2gvVElyNjEx?=
 =?utf-8?B?bm5CbnhLQWx1Rms4YmJvL296ZnZBK3UxWTVvK3VvRytuUlR4UHhJcFBjczZk?=
 =?utf-8?B?OVd4QXFnRmNja085Rmc3a3p6Q3hjaFE5SjlELzF4OXg1bVEyZHJIYWpMUzly?=
 =?utf-8?B?dm9TeE9EaWpSVndLWE5pUDRudGhJWkxRbFhzbk1GMTZRd2Y1UHV6VXlrL2JQ?=
 =?utf-8?B?djE3c3FVQi9kYmJhdGgrNzR4azg0dFRrbzd5elhNTFdkNmtKVnJveFlUUTRS?=
 =?utf-8?B?VTF6MkxJTjZKbUtzc1AzamQyUkR6WllMcjRIN1ROMGt1ZWlZTGV0QmxWUEd1?=
 =?utf-8?B?NXpBYW9qUVlkZmdLcjBiZTFVS1JGb3oyU001d1lxbEpxcnpJL2RhS21sWCtX?=
 =?utf-8?B?SGQzaU1pdXpMTE5uT2JCcjB3d3lYa256ZUhwcmx0UjN2eVdTbkNrdTNKcStF?=
 =?utf-8?B?WXkyell5MWo2Z3A4N1dKQjVMeG16RHVnNEs4WW5BdzZ3UEp1Mm15ekJCK2Ny?=
 =?utf-8?B?czZFK1JvVXJYdWx2UGN3S05sZWN3UFpzQWhaVHBjNEx2aktBSUNPRkhXQjJX?=
 =?utf-8?B?WFVpcTRuR1VaOVRmbWx5SE9ZVTFBMnFLOGRQN0hsOHJyMkFoRkd2Yms0UXJC?=
 =?utf-8?B?UnY3SWt1bUdpd3JZa2FkbUd4a2pXQU5VbHdNRHJRcWVYSXR5UXpIUEE5aEx2?=
 =?utf-8?B?M0NJUVU4bUN1eWxKYjkzbEJoRHRXWnJtM3FjL2xLWjNoc2c4dDVoWFFrbUwx?=
 =?utf-8?B?MURUdVFkaDhpU0cyMmo4ek5wSEZrdGxJeDNxK25QdGxPcXF2Y2VtZUpnL0RD?=
 =?utf-8?B?cXVjQnNJSUFYd3ZBdmxUeEdEWEdZZytFUmU3eHpCVHY3UWU3QTFWdzFTaWts?=
 =?utf-8?B?Z2syRnpwU1hoSlE0Q0toNGJZUi8xcEJBb3JST0NJdnNYMUhDamlOZWhRa0VB?=
 =?utf-8?B?SmRnKzdIZmhaaUpLSGxwZmI2TCtGcTgrbEtOZ0xkQjdjNGZRLzE1MW5PRUd3?=
 =?utf-8?B?ejVGS1lvOGZ2VXpxTDZXenNIQTZ4eTgyZkk2TEVCTGFvTE1sc01uUis4UWtM?=
 =?utf-8?B?VEtLQ3VkS2xLQXp1UHVuSnR5YXA5OC9tN1VVZWxobUhMbWhGMUMwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4543de07-068f-4fa0-1bd7-08df335ab0fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:14:32.3230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki2d7xM/e/VXEHZbJbNptcUl/iphP/kBF+q/VlJ7tvM6z9LL9yX/+Foy1xDtFqDOwzTXgxNjMs+hO1OpS0gZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999133



On 10/26/26 14:38, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soundwire: amd: unpolled IMM_RES_VALID clear in amd_sdw_send_cmd_get_resp()
> --
>
> commit 3a55a761f23cc08cf1a64f142c04e1aa78cc244d
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: return response on IMM status cleanup timeout
>
> This commit changes amd_sdw_send_cmd_get_resp() to log an error, store the
> read response, and return 0 when polling for AMD_SDW_IMM_RES_VALID to clear
> times out. It relies on the bad-state check at the start of the next
> invocation to clear the remaining AMD_SDW_IMM_RES_VALID bit.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 307cbfdb94422..0b83126b5ce6c 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -285,11 +285,9 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
>>        writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
>>        ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
>>                                 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
>> -     if (ret) {
>> +     if (ret)
>>                dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
>>                        amd_manager->instance);
>> -             return ret;
>> -     }
>>        *response = ((u64)upper_resp << 32) | lower_resp;
>>        return 0;
>>   }
> [Severity: High]
> When this cleanup poll for !(sts & AMD_SDW_IMM_RES_VALID) times out and
> amd_sdw_send_cmd_get_resp() in drivers/soundwire/amd_manager.c returns 0,
> can back-to-back commands read stale response data from
> ACP_SW_IMM_RESP_UPPER_WORD and ACP_SW_IMM_RESP_LOWER_QWORD?
No. The response for the current command has already been latched and read
before the cleanup poll is performed.

The first poll waits for AMD_SDW_IMM_RES_VALID to be set, indicating that
the response is available. A timeout there is still returned as an error
and this behavior is unchanged.

The trailing poll only waits for AMD_SDW_IMM_RES_VALID to be cleared after
the response has been read. Therefore, a timeout during this cleanup does
not invalidate the response that was already obtained.
>
> Callers such as amd_program_scp_addr() and amd_sdw_xfer_msg() issue multiple
> commands in sequence:
>
> sdw_transfer()
>    do_transfer()
>      amd_sdw_xfer_msg()
>        amd_prep_msg()
>          amd_program_scp_addr()
>            amd_sdw_send_cmd_get_resp()
>        _amd_sdw_xfer_msg()
>          amd_sdw_send_cmd_get_resp()
>
> On the immediate next call to amd_sdw_send_cmd_get_resp(), the bad-state
> guard writes AMD_SDW_IMM_RES_VALID to ACP_SW_IMM_CMD_STS without polling for
> !(sts & AMD_SDW_IMM_RES_VALID) before issuing the next command and polling
> for (sts & AMD_SDW_IMM_RES_VALID):
>
>          if (sts & AMD_SDW_IMM_RES_VALID) {
>                  dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager->instance);
>                  writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
>          }
>          writel(upper_data, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
>          writel(lower_data, amd_manager->mmio + ACP_SW_IMM_CMD_LOWER_QWORD);
>
>          ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
>                                   (sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
>
> Because clearing AMD_SDW_IMM_RES_VALID requires an asynchronous hardware
> handshake that already failed to complete within AMD_SDW_TIMEOUT on the
> previous command, won't AMD_SDW_IMM_RES_VALID still be set when
> readl_poll_timeout() immediately checks (sts & AMD_SDW_IMM_RES_VALID),
> causing it to succeed on the stale bit and read the previous command's
> response registers? Should the bad-state guard also poll until
> !(sts & AMD_SDW_IMM_RES_VALID) before writing the new command words?
No. If AMD_SDW_IMM_RES_VALID is still set on the next invocation, the
bad-state path clears it by writing AMD_SDW_IMM_RES_VALID to
ACP_SW_IMM_CMD_STS before programming the next command.

This behavior is also consistent with the hardware reference
implementation, where the bad-state path uses the same write-1-to-clear
sequence without polling again for the status bit to clear.
Therefore, no additional change is required for this scenario.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261026044507.2310694-1-Vijendar.Mukunda@amd.com?part=2

