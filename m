Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013010.outbound.protection.outlook.com [52.101.83.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB343934D
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419061; cv=fail; b=ZN/IdyglCTiCbUiFspFRjAfn7zVcu9QXXhbRt6Z9NZflecWMmU6bHrfw91urPsiiUFfzzCRNORH6oDpwh61438JinH5BSADDEBH87v+QDKPCbGVkvMYRg9acIdHNbSMUkuPu5gBaWG4/lOTPrsZAbhQFR9m5HUolkMDgz6ni+Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419061; c=relaxed/simple;
	bh=QXm8xLONCUDzFfa6mUV0usa90a3AEAnI4CyDtvE+uRo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lMK99K/On+Prgei96ZKLMu4KEyll7xN8OCLQUqliRHPFB9EBAz3eSusxJqN2lV6s9PDia4jG3X26GffW7ANhJU9eFHnXlvdfWLhZCM2VGEDKkA0hQnlVsQ4406DDRPaid+T/AQ0Kxw8eJYCqtMPOl9NG0VwP7QIDW7aP1113q6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=WLYUgsiY; arc=fail smtp.client-ip=52.101.83.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="WLYUgsiY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBuTWKFG/+r1YQEjzJznjqzIxWCvNfZZkZJen7EDvWImcR8Pdo5SjHMo8FHY/VFUwWFK7dnMyeENwxV3YDp04Z85sK7wk6W5oe4Gs5hbmyjjICn2pgQH2sFNKED2gYogeXc/u/RTBu8bGp+d4HZIFehq8uxBiocGJ8xbubq1T4YIkXEt8Ow0uMvSAXDlnNo7f5iHhg4vlifOGiY/QT+gqn5Ghug+f3Pqh4RO5NIl4SqKmcnfC6r6wmXxFEX19OhpDKwoR1/0TrdEgXI1PGmE06Zzx0vEYNQYhrEuXwQPSoOJ2ijXn2GumV3+z7uQ1Tk86gsI++55Tv5WCgsIXKkKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad8LOGRnsFFjWJ9fkUIAVnMhyyoblcf5PyjbX5NmHkc=;
 b=w7BJ0uTyaKKtd8NEAPneJKF9W89wLnm5453dYAudp1k/dPYDx/g3JPYhzgCl4DVz+KkB1Pbx/b1w3SAFI+HLxxFcbCX10MHbye7bf8eCzCvjU9mw2hQlsb77qjHBvcfz3E9uOVCJv08wuTTgIPFWnBVaAJHZHuyI6rujo+Fd62rgu+kio4dty9jJjTDVO5l3xHoNVcec0qGYtQHd2BLYFtMh8hHzRVW7INcXLjifJU7wu+8AGLjFDit1b8BI2qUcLFBZjl/NgNYZiJLgXYmYyU8/0OfRwgbG7mdJ/pKwQYp5NIefBBz4I+/Y7ilgTfi00oQcF6S3i72kOzbRuF6r8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad8LOGRnsFFjWJ9fkUIAVnMhyyoblcf5PyjbX5NmHkc=;
 b=WLYUgsiYJup8oX2Mt+61n4FBa054NR79EPgDZWDnJU07Jd3ffoqvqWPv2S6XCoi/5JHb8FW9sJmjua9rzSS0olc/aVI/GTDmo8CSnoPoe7UjF2lgCGPz6by8DcALL05wwOjNaMpdXBTKRYM75LNvC8BtVMUpZB++AJxfZma/Zkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DUZPR04MB9795.eurprd04.prod.outlook.com (2603:10a6:10:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 13:44:15 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 13:44:15 +0000
Message-ID: <1498d77d-e978-4bbb-8cde-4773becb9a47@cherry.de>
Date: Thu, 30 Jul 2026 15:44:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter
 for RK3588 Jaguar
To: sashiko-reviews@lists.linux.dev, Quentin Schulz <foss+kernel@0leil.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
References: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
 <20260730-jaguar-can-v1-2-9b566bd785da@cherry.de>
 <20260730133511.2F6A31F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260730133511.2F6A31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DUZPR04MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b70c583-e8ea-4778-5445-08deee40a54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iKSEKdSjNIIDUByec2pm5e5mZe71ueVtRekQtfl1R7KqGhDV+Kn/gSPT/EQdX5CCOUIbslRl80ESlcQLIjFm1iNsopP0itB5rkKdzg2Sd/0ZoNzH4KUnqNlyyssbtq1veS3gsdALxD9GyclPMf7o6bXu3QjnUnpSIikpFeV16hrQRlBiYaguR8Wnxc++KDqxQ1rx+i+7EOcLnnOJLgLfM87V8fxf1KPQ1zJbtlt9uGux7WeqJzs0RSpsNCJT8d4ZPgXZ4WI12GqHvGZQHuUHQL6ypWt0r4G2rRZDtxWuP1xhTLsqLJHXCniXMtOhwh0PlDLtaFVMp6DO1ppW+F1o4qpJ0ad3f+myRItBOLrFmirJuV1pTMnvO0zsUHvGa6owYtOqMZE594sRgk0aBkJyF81CDwVE7Pb40oJLJ2tbAKJmzkAIo7HEq2gkkOVPI6ELyJy7zn7QtTZfVsZu4fUGv22W+0S4G4yJUGj4gAoX4+/xibr8L195Ycgn6O3tY8imr7OD9+kgujk12cX55B4Cw1T3puVnadjKzI7Ikxl8SddZKTZZrOBZjQA1nW7zJ7PnvNXHER0YRGgxU2Q9WBV60tcdIFpi3fxCphgwIu2nQ/6gICCTd5TLVCITKI92WsJevrRrxRwoYnqizc3ll+TAT/drmhRG5a6cJLWhfS6YgAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhVclpNUFp4ak5Wd2hjc1RuTnJYdU5yOFByM2YrdzJEY0dNT3lwSUJSQ2w1?=
 =?utf-8?B?bHJ0bStiYjBFdzluSm9yc3lHUjJnNnNVTTN6OE1ReXZ4N0pmbDFZQ2lxOFZQ?=
 =?utf-8?B?SSt4SENzRWlQaWc3YkZrc2NxbFA1USs3Z2VuSFZEWVl0dUFOTWNVeWdzUldX?=
 =?utf-8?B?UndkYmVHcHZITktveU5uZElVWlpJUFNFNmtBdFJXcDVMdnNpZE9iQ0ZGVVV0?=
 =?utf-8?B?M2dwajYxeDFlZHlQNHVmOXNjcEQrUWc1WEU1TzU1WnZyRi92cFBYbmJweG9W?=
 =?utf-8?B?Nis5TExXdEFrRUxuMkZkazl2UGtuVVkrbjdsNi9sOHNUc0xvTUcrME52RjRR?=
 =?utf-8?B?NklSdVRTSkRZdlRVdCthaWxsZFZuMGVrclRwdE03NjlQemEydU9YVUZRUVdw?=
 =?utf-8?B?K3JFbGFRQzZLRWpuMnBHN3cwRVo4eE1DRWRuQ2FWZ2plb3FiUk8xVjhkNGJv?=
 =?utf-8?B?a1pHY2pYTzJKbEp5cVNWcElhMFBrK05GU2xhQ3FsWjNVZ0lKL0R1cHhhMlp2?=
 =?utf-8?B?bkVTNVVyMmp1K2htcGYvcDhIUGRydkJWQWR4NWZ4cEVpa0tlYzFINmpsSUxR?=
 =?utf-8?B?Y3NsY25weGFJV2FTOHRKQmVlRHgzV2h0R0hzTkhZcURPbkIyWlg1aWlrbE1J?=
 =?utf-8?B?UUZxTWRwQ2NDZkcxcUtKRnRKSTM2WXl1RkdXVnJTZzYyUmtrelU0dFU1MjJT?=
 =?utf-8?B?M2ZmT2xFSk5YZldVL0VjZ0t0ZHU0N3hKOVhmZThBc1IzZWp3QUF6OEhRT042?=
 =?utf-8?B?NlZYWld3SmY2dHlaa3pJQloxaU0vUlVCajVIUW1FaE5SZVVjcVQzc21EWCtQ?=
 =?utf-8?B?aHdFbjdwbXcreHhrU3UvMzV2TGpqak5nT2xWZTlmci9jbnRTaU9hNERVV0JD?=
 =?utf-8?B?V0p6SktGNkpQRWpuZUlqUmtqcVEyWVJwWWJZWEV2QVV2VEpTSzVDaHZrcEs2?=
 =?utf-8?B?YUNDQmNMQU5BdjF4OThyS0t0dW9PckdyYWFrSmk0bmorNFVKSmxmREthMGpU?=
 =?utf-8?B?STNmdGluM3lZQTZGQ2RvM0pNUHJQYkxGZkEvODAxTHZqOFppZElPUVhBZWtG?=
 =?utf-8?B?UVRrVkZlZHd4SUFEZnBTY1hCbGpxdXpwcnZvaVpCdTBrbzdwWmVuSis1a2Y1?=
 =?utf-8?B?STVIeHp5TVhxUnpOak5sem1qajkwaEpTZ1k1Z3FiakNRZy9BaVErMENXd2xu?=
 =?utf-8?B?Um8vOEswZ0VXcVVycEhyektnV1lLTGNlNGU3bWIwWGFueWdWaHZaMXVlajZa?=
 =?utf-8?B?NjhoSWZFKzFFQkxHK1YrY01xbGVoblg5QWdFZEFFdmp6YkVuaEFFOFhreGNG?=
 =?utf-8?B?UEMzeDFMdi92aGpLNVRuMjUrVis2RHBYYVE3UUFDK2ZNTjUxTW0zZ1ZNN3hu?=
 =?utf-8?B?RXQ1Z1FoYlJndWJTTDFWbjNSSmlQdDZ4SGdkYzNwbHJFbTN6SEpoQ2pxVENN?=
 =?utf-8?B?UXN5WjhhUUhkbmphZzZvc0tHbVVVQWRzTW1KNHAyNDlkcXhvRW1IcVJXY1lz?=
 =?utf-8?B?UWlWalY4U0hPMktrOTJocWhEelNiNTg4aUEwbmRmRnoydkpyVGptanNXYWhP?=
 =?utf-8?B?aUo3a04yZllRaWpxamg0NWUwYVJjeENheVlpWWdvR0dEbENucmtOY3JtUEsx?=
 =?utf-8?B?NzlnQm1KNmRnOGVqcXJONjBNbzlnYlJpS2d2YlU4N2xQUDJzSlluOVpEbFNQ?=
 =?utf-8?B?NXN1RmF2d1pwVjRnTmdoM2czZDVRY3NGNUQwZlh3b0s2K2tOSFBlME1yQkNw?=
 =?utf-8?B?dVBCZkoxSkNkQ3VuQkt1RmUwQVFkWm1NQTZMK3kzcW9xTHZWSUlmdkxpZFV5?=
 =?utf-8?B?L0MxbG1Ja3EyWXpXWlA2ZllLU05CdG9WSUV1d1N2M3dydHVvZmJFblhPMTkz?=
 =?utf-8?B?cDRxS1dtSlZqQWVtUk14NXhGWmlFY3JVNmU3MlNqeVFKNEtJaWc1RjdLOUpY?=
 =?utf-8?B?cVZtcERSOWpoSDVhOFZDK1pEQ3BWVElDb3lCUFJXY1RrNmhveXNSVWljenFw?=
 =?utf-8?B?NVhISkVzWko5aFFROUQ0VTBQcTdIcGxJWjdEcFZibnc3NmE2djZ0TXVJY1Jv?=
 =?utf-8?B?QjdGenFHWmJZWTNLN2laUzd5OHo4cFhsWGppaWZEZjBWWXIzYk1oKzdMWm0x?=
 =?utf-8?B?SkdnQzFJT0pLalczaHRjQlhIK09UdkUwUlRKZTBDenFvbXhJUG94VnVIbERt?=
 =?utf-8?B?UFhRUXdxS05SS3pyUHlOTXJsTENCR3N3cm1IQVNGdWlkN255ajV3bFNxQXIy?=
 =?utf-8?B?dngvSmIyYlFwRFE1akRNaVJBNWtaVEdzT0NqUS9KaWM1QklmL29qM0d4Ukcv?=
 =?utf-8?B?SFRPSjF4N3FhSDljVG9LNnpMd3JqMVE3ZUJGNitlZVZjczRVN3I4dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b70c583-e8ea-4778-5445-08deee40a54b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:44:15.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NENL0c5g/Nfw9jqru6ocfahGcmvtgx35OawX8rh6Me2MfYe0FOqqe2du+85zOrVr15gntgWd9JcSnoAiOoa9pZjzStsNytT54CqWo/c9h7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9795

On 7/30/26 3:35 PM, sashiko-bot@kernel.org wrote:
[...]
>> +
>> +/* RS232 */
>> +&uart4 {
>> +	/* ST3232B only guarantees 250Kbps */
>> +	max-speed = <250000>;
>> +	status = "okay";
>> +};
> 
> [Severity: Medium]
> Is the max-speed property effective when placed directly on the UART
> controller node?
> 
> According to the device tree bindings (serial-peripheral-props.yaml),
> max-speed is meant for serial peripherals (child nodes of the UART).
> Standard kernel UART drivers typically do not parse or enforce the
> max-speed property on the controller node itself.
> 
> Will this actually limit the baud rate, or will it be ignored by the driver?
> 
Forgot to check when porting from downstream. max-speed is seldom used 
in Linux kernel and it is indeed specific to devices on UART as does a 
quick "git grep max-speed drivers/" tell me. I'll send a v2 with that 
property removed but will leave a few days/weeks for comments, there's 
no hurry. Sorry for the noise.

Cheers,
Quentin
