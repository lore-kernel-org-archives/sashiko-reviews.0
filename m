Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792721556;
	b=sxPQ31LibwA1ct6+JZglqYlMIRp7VHoNwVUGJzjMKJE8f0fFaMEHUyPdoQIpIclDs3fG
	 rcf9+ixNq4YB5krR5nIYhAviiCxdbOwtOmx9ux6z/2Mj4V6BJnDuNzo3qfL4YVVdADWbC
	 jxtdvbrW3SPQ7WYEldVx3DJS/ZZSdNBqEaNAv0NyRL3mET4AvOxPI6d0LE9eGbsb8PgNN
	 mTQnow08x2OS/k9l1zW89CtFt69jw4OrkdiYLv/Z+jq4b6ZQQkxQEYeqrJy4ZtZ3GRXVS
	 ok6jk0qY9CtnXVy0g7zc3OVrkkigd3/3hSnX7bdVTEVq9yfcpYeFHebu3KZY2zywiLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721556;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=S7BZK7270ygKjfPzMd8itp2YRvcsgjjzRNtX6MFQlVk=;
	b=e1pWMkPPG9bflWc7bHlkv+uNz0+tA5I+STw4CwlstBS9GX2DhDSv89hfE+BX2QMYjMPY
	 xkvVrfTRSj+br78i4geiBHKXA7cr/oI2Qs0FzeI7hHd4UzKu2lhBmSdPpJBAt9lB7XbSD
	 hLKoDYhUW4iaqJXcjh9bXjcAnmsMsU9KbIlf/1aWlUdwvSbl3OjT3iY6yCISJjWPSRmw6
	 fluTX1kdHp1LmtS91UbYbC7cTlJd4vggJCsgzErbbybNoPMgkarDSg7ZPenwKPZCBokYF
	 LO6iVGG4E2qlRn84Wpl2cCq2sKNmAC5jKwLV+IFel/qXLf8KxwvaiGJfm89+W5Lcg2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r4BcJFlq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.30
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE99606A319;
	Fri, 23 Oct 2026 02:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE99606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=r4BcJFlq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTjvXAW9Bq+FBCETD3U5sjbzRIabLaO6qGaYgucDfProu1C3WA/mI4ZQFgeGaUQ0AYE60BNNbWt2nX4+EIx6Ct/NZixms5y65rAgeOQeduZ9KTzkmD8r5qVDh6flvQw2WNlgMaqaSsKtjhQBxAiVan1yf++9bYboPNqC0cr9PgV8llNyoukmKwMXil20P/kNqappsRdL87gJQTOzDcYgbMmX6kvT3FiXGnf4q3t/A7tUgj/+WikdcK1I/Cn0BZT+EUfwuhI5R353bvYSCN0Dwzo0JrutbJ9Co0+XJPSV3mvy4/wMxPScNnFHkbsGBxAI8WGYoEt3Nb1tIknLUXuqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7BZK7270ygKjfPzMd8itp2YRvcsgjjzRNtX6MFQlVk=;
 b=F2vYw1ho8Om/XWKEUMCZ8+KgZERzD3V7pqI16wM5cHwVAsLuFPzFpRhXMSjHL62ZLScYiChANLOvnM+ha8TIa0dX5JqUXXh1T5Z2FEBdX9gpGDRUiffxPiacJiO/OQEWDzFRb1kpdSMTT2rzRwrYWV6syAk+QccJmB4Aekv3r1ScvlBZr9C/KI4za8szx1+YRSAwDbkPPgyyZR7SvbcUtDk5CxOT7akt0C9p7C4ByjYpmZoo7YzLCIv7X5rf3LGbi87emdoTu3TGfY8a88/K5wN17WxUXac2oy5tI9H7MVZMgQfcLos8nhs57n5KZfJX67/P3JuYa2RVQTA4bfGukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7BZK7270ygKjfPzMd8itp2YRvcsgjjzRNtX6MFQlVk=;
 b=r4BcJFlqnhNipIAS4C/X8aDWD8TBQWSAolSmGokUebSj0fkCwyjyRPdBwXAzEOOztgkKKbsPm9HDWuL4Z5341qaCuuf2VCY21GRfEW1SBxEP6NnhqNFXrVWeuwISML4kH6bR2q1xDHBUATZPrtY3YG7DVrGTk2lL4QXhm2SC5QwvAUbVis32pOJGhAAVNVuj5/793/bDjkVbKeDm3cPjRoYGkcAEgXE7dWPmYXUtv27OAdiv5Mb2hQ/WJKSod82ixD0OEBUgCyad6fsw+gor+d9PFzizhl+m6pO4+P6oucxq+H9wQLJBM2MEvBBSLfztcOVDCkdJht+PAzMaWnGCNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by WA4PR04MB026519.eurprd04.prod.outlook.com (2603:10a6:1d0:2c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 02:12:30 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%3]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 02:12:30 +0000
Message-ID: <74d006f8-33e4-4157-a0c6-a0045be323ae@oss.nxp.com>
Date: Fri, 23 Oct 2026 10:12:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase
 properties
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
 <sashiko-outbox-167770@kernel.org>
 <atp0uQDD8EuhYyb1@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <atp0uQDD8EuhYyb1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|WA4PR04MB026519:EE_
X-MS-Office365-Filtering-Correlation-Id: deedf626-6658-48dd-6247-08df30ab16d1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|22082099003|18002099003|4143699003|11063799006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tz778LuixAj8wL68MkQTVuryG0bfKj5Cw9QU88MKHixGUECwJ3Impce7LmeMQt86rQU+3dPMUasEGhh+Yk7RVyAWKDVDCS9tx0K/x6yJYInn59eIAL1v4MCXeLK0rIgLjVdTFD4BIpkE93ktWPlbfsvYNdMNCGPk3/hBcXqtiMpASlb4tPiYiDSGv8UuHUOJ9mP2vaFlly5WLdgYPwIkq95mloActry6KNoyf+tLwhnE0CSau0BOdm3fncNuMTV9iYkNsVVMGSilASc68wYXVc+osQXUblXhO9ljIzsz5e4LZCXN8rNxm5GkGEpENnjBu5AxFGPedcS9tt5uEAB32Z8WMdjbrduRIq8sjPidW34R4U6Y6vDGw2Ar8Qz4/OayK9YVe9Mw84spztVid+d3AlcsHex1MKVIoMUYi8ut2PTq5Z1MysgJdnG+jwMULo5RK7M83SRYXmYtbSwEHlWrUXzW5wPXVt2iV44/arS36Br/QjbX9cRx2ib0rm1lTv7I7MKagtkIfyB39TPk3+gHpnh5ClHFipRNxbIfg+hIej871E55JmFYH+MM2dedQAcsCdWxu+jhzJUahmnW5acsp+TsR2yXxwDl2wfB700OB8sWT85brd48OPKWUgeNOksEvEhqxOnZHIQFrsdC3B+45gVtf4rvcNilpmu+DnTNRV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJoTTVMMHFHekhRelNHTVpMWkxTT1hXVFllcGMxODRrOTh3UXVSRE9oSEdB?=
 =?utf-8?B?aFdzbkJoY1RZak5FbjFCYVEvb0Ftd1EyWCtXbEgvVDIvRVgzWmhCUlU4TXZ3?=
 =?utf-8?B?N1FoRTBnTFRxYzhuTjZmbDErVDliYWJjM1FQV3dlWnByZmN0bDV1K3FnQTAz?=
 =?utf-8?B?WC9PeXQwN3Ixa0xIdWwxV3dYU3Y1RUxCOUZBSGI3NE0xeW9xMDhDNEJWV0h4?=
 =?utf-8?B?NEJNbnRzRFRycE1RUXNvWFNxSEtvYjAycGl6UHBmS2lJT1cyeTY5NUZOZ1N3?=
 =?utf-8?B?RTdjVjNyNWVJcHdmUGJZQlU2TUxjRklDblFVYTRjVk1TaXVnOU9hNitmZnBD?=
 =?utf-8?B?dEFxS1VQZlJGOWsxZzAyTU1hZkxtenU1V0ZkbDlDY2lBaVBxSFhhOVJSeDJs?=
 =?utf-8?B?TEV3Z1RTcWpZbkJnZE8rTURBR1ZPY3l3OUJ4SnA2SUtBVVgwdzRNSU9sZk9r?=
 =?utf-8?B?Tmx0U0VQWldsMStVVURaTkcyeFNXUXVYSFRUTndYbTB3aGQyRHluRi81T3Ux?=
 =?utf-8?B?RHZFRm00SVBjYU5iUnJJNE9rK21yUFZNM0JCblQzRDhrT2lUMUlzNFEvNWdS?=
 =?utf-8?B?QXdiZ1M1NDlHL2hwazZhbjJ5Nzd0L3NCSEVaSVYzdE1MOU1DSkhaOWZlWlNI?=
 =?utf-8?B?L0JkbzNHaFVGdktocmg2QjJNY2tVQ3RVUGprWGp3TE4wa0E5VHU2c0xlUEFX?=
 =?utf-8?B?Uk11SXdZVDJqS0Z5ZDBRL1B2SFZNaEZaZjVRZlkxeURVNnZuWkxXQXY4VUpQ?=
 =?utf-8?B?UlFRRUhwSTdmL0dPaHFMVjdVQ2tvTklIT1FDdFZpSEVKMGMvRWdOWmZJK09O?=
 =?utf-8?B?ZzhrTG1sdE5iMk5BTzFpaU5JZ2JtazhKNEVjS24xcmRyN1R6RUtoWUU1dHlI?=
 =?utf-8?B?eHo3RWhTaGg1K2FCbVI4NGFTbjVrdVZCMHBHTTdGT3BqdnkxeS8ycURJcE96?=
 =?utf-8?B?dUk2N1hrNXhBbjNIWi9jMEdUTUNRYy9mdEczY1dObUlBaEJYS2NXYVBoRzlh?=
 =?utf-8?B?a0lIenBIaThjNkM3NHlXTEhWTzNYbjN6c3M4OEtZK0RhakNMMUZnZ3d3c2Vr?=
 =?utf-8?B?Z2FYdTNiZlNCYXFuV2ZpcmtWanlEU2VvNWdncTVjNHhnekdrakMxTUhUNWF1?=
 =?utf-8?B?dFpiNzlpYTNoeFBFMHcxS2xOdmhlVVRUeXFIMnpGLzVYeS9xRTFMVmF2SzVj?=
 =?utf-8?B?K25jZEN3bWQ0Y2xGc3ZqV21Qb3VLSVZzajVCY01SMVdHRUFFeHNOWElOWFVs?=
 =?utf-8?B?QWFMMS9BeXNqVTd6VlArcklyUUthdkYvUWlNWmZsVkc2cW92aGlON2MyR2xi?=
 =?utf-8?B?YWpIQUhTRU5ENGV5b3R1cURsR0t1Vjc2ak5NbVhET0NlY05zQzM3d1dYcVdS?=
 =?utf-8?B?WmxWZ0ZJRjRnN3RvaURTRmtQVzJUWTBYVnhoVUdTRW9zWDBBb3dwK1B0aGV6?=
 =?utf-8?B?K1FzZU82a05Vb2NGTVJXdVpFL0FiMlFzVitqejZaR0hyNnhoYTNIQ1FTTmJp?=
 =?utf-8?B?UkJHV3Z4SUVnVlYyZmtBYW52eUdySmhNRkVtbHVFb0NFWUFZUzk3NS9oWjFN?=
 =?utf-8?B?MzZhVFB6Y21FK1p1WjR2YURzaHI1Q3EyUUVjdDl6dndXTnlwTnQ2b1k4SnZ2?=
 =?utf-8?B?cDJlVC9mNnhPZFkybmtoSGk5NjJBOVErT3JkRUZwK3g2OU9OQUhOT3Z0eUh6?=
 =?utf-8?B?WE5kM0FrU0lUdUJNek82R2ZueTZFVHZ0eXNFY2pDVkVDMThXd1NlckZiSzh6?=
 =?utf-8?B?WUNkRnVWVEt2RjQvUDZhb25RMStEM1A4MWl4TG5TUldrWW1XRCtTOVhZb1E4?=
 =?utf-8?B?c1gvWXNIaEF3Mm5wVk91UVpqbDJ1NGZDYTJtZGRjZjZZZndOTU5CSjV5QmMv?=
 =?utf-8?B?d2YzZHZXK3NhR29MR2Mzc0EvUmF5NGRoSGRaTW4veEI0a0xySU1xUkZsYnV3?=
 =?utf-8?B?RWsxbjkwSVBhWlYxVEFOMmliVE40NGZtYWdDUmZza2sreUFIRmZ0YzFXU2Jv?=
 =?utf-8?B?K0tMNDh0TFNVWkZkeU1DeGxCelNGZmxKSFIwUlh1ZVNpeEhncW8rMkp4SmE4?=
 =?utf-8?B?aXpRbWNrNlZ6RXZ0T2hOMVh1ZVhhTytpdWJ0RSsrTUswd1M1clYycWYwZ3Zu?=
 =?utf-8?B?anp0WjM2ZVkwdFJSR25STFZvZVUxejJsOXg3bUMzc0JjdjRYTzdkT3BFZ1o2?=
 =?utf-8?B?MEtMcUpVY2szc3BYMHFWZHBOQkI5ZU1qcldKekhBRktDMmlHQ1VoeC93SStK?=
 =?utf-8?B?YjUwYllWOWxRSE8yQjRxbTF5WnA0SjUwb1hobjEwMmVtekQ2Y09xRlZjeE1C?=
 =?utf-8?B?RWxhUjV5VkhKZGhJRHdZYjdXWWg4a3A2R0J2cHlsMmZZdkY0VUxCZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deedf626-6658-48dd-6247-08df30ab16d1
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:12:30.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fzwgZmvW1WB+/hyOkkxgxVcoHTo5QdlDB5UKlGFllWYYrPsia3I8tlynorPjg9qDf/NTnjxuEo3Wx2hPSBsFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB026519

On 10/23/2026 4:40 AM, Frank Li wrote:
> On Mon, Oct 12, 2026 at 07:01:30AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] dts: Missing bootph-pre-ram for gpio3 breaks early SD card access
>> --
>>
>> commit dc22078eb20524e315ef0d520678ff9336ed179e
>> Author: Joseph Guo <qijian.guo@nxp.com>
>>
>>     arm64: dts: imx95-19x19-frdm-pro: add boot phase properties
>>
>>     Add boot phase properties to essential resources during boot phase.
>>
>>     FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.
>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
>>> index 1f62d729a5e77..8dc1134f8d24d 100644
>>> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
>>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
>>> @@ -180,6 +180,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>>>  		regulator-min-microvolt = <3300000>;
>>>  		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
>>>  		enable-active-high;
>>> +		bootph-pre-ram;
>>>  	};
>>
>> [Severity: Medium]
>> Will this regulator be available in the SPL phase without adding bootph-pre-ram
>> to the gpio3 node?
>>
>> Since the fdtgrep tool extracts nodes tagged with bootph-pre-ram but does not
>> automatically trace and retain phandles for nodes lacking the tag, the
>> gpio3 controller node will be entirely stripped from the SPL device tree.
>>
>> Could the gpio3 node also be marked with bootph-pre-ram so that
>> reg_usdhc2_vmmc can resolve its GPIO dependency?
> 
> Is it true?
> 
> Frank

In u-boot, the gpio3 node already marked with bootph-pre-ram in SoC dtsi. No need
to add in board dts.
