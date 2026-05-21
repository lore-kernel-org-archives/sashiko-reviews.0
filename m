Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4190306756
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 02:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779329078; cv=fail; b=AqG5IDRvdKPEskaF62o2Stb2TCxpTyww6Hsfk0b5ofXBFQRJOKcykl8GmWTzV/qdH7HtWE39niO6TbVMDEWj35Tmiuog4dCS7HKzfjFcyhmwa7uBzJzjf287n4uQpXPwRdYK4YZ6O/SwjW6JPhw/bNnpJfegfgDKSyQhVLRzXxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779329078; c=relaxed/simple;
	bh=MpC10sgwQKnTetQdSs7fhOXSRAw/niz2KsuHGHD6DiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lgBT8py+YuRTAquBqjMhZ/oX2Srsr67kZlnPLGh/umKkX8G40l3N75NZ9yO2dBZ67NRoNpg9Exg6hflAP6H12WZs9hqTbAvmcdihJQoYaIUyNDmEUuyx6MuO2u86LSjK4g7dzAIH9jKnKgkbQlhJASn12uXJ3Rvg1a/2yuMh+4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ldHg4uLn; arc=fail smtp.client-ip=52.101.62.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ldHg4uLn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6mlOkksEDH3RoQw3SLUnuHgA+wTAp8sfjSMWx6srkZ7e7CItcdVofERgr9h74XE9jErkXxn+pzcNA+Gs4fLF5dQlFJJAdCSQndizXGSB1Ua8HK/kLLdzZ+kkwHyCr2HeMGUuO7Ar5+fi/f3dvR5coOdCmgBV/Dmi986mWc2PIOoCDD5DUhMZyyPEaVFIdMJmPj5FTcdgyUyUJfSgkFsIhTghiQFzJpyIPY+wFg3JUrueHpJKGHkj5McBL4mIKPTdNrH/cIRV3402RdH8bCll466RA5I67abzfeqOQFH7PuUNU4wraQV5Goeif9iRXrz21W1MbpIkkXGyxpKApFy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2+t6sF6Sx8k4/utbUUZubydDX498viuywYgRHTjxY4=;
 b=W0lPHVp6Tf4DkrK1sIxFW7cnahRnyM3aC0ENiSldMZly9yuAsYo9nh/eLQ0izjJnEmNCABM9LA4xU68pqLY6ijVlb012Npnq3xnRLNAvPbq6yCQPMIh8yoM1etd7Fn/0Cg6ElfyMKtSkdVLIAbbg2WkmXReTPwLSCbXOMUBPQeoF7qZKNea8GXMF+kd0L8B/7HqZ8YtEp8CkpENVeWiZpVTiUWJ67l27P5uGZ2Pt/nsP9axY+rdFXGzcQqo8ttAc6kYWKF7HP6ep3AQjTnJZrEVTUg3C7G31LfbhGMrUZwLjvGOwlEhw6hyFqhFs2Db2cJ7k0fTuQpchKdlVHpW3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2+t6sF6Sx8k4/utbUUZubydDX498viuywYgRHTjxY4=;
 b=ldHg4uLn3ELV24GJ5hU2nBUwNiVWBpe9vOYlBJ9o9hjJjIU7IJxpK//YLSkVXDrEVrsVGrJTQXJqUXwlrYOgKg0+5Wq5TnN/CGYfJkIKRpZRCw/dGTOID4LjzxsbBrI51UEEbaIVhAfxp0clR+c6VUhMMRbnOgmDegimPei93XI=
Received: from SA0PR11CA0146.namprd11.prod.outlook.com (2603:10b6:806:131::31)
 by LVUPR10MB997810.namprd10.prod.outlook.com (2603:10b6:408:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 02:04:33 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::5f) by SA0PR11CA0146.outlook.office365.com
 (2603:10b6:806:131::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 02:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 02:04:32 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 21:04:32 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 21:04:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 21:04:31 -0500
Received: from [10.249.132.118] ([10.249.132.118])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64L24TVD3148672;
	Wed, 20 May 2026 21:04:30 -0500
Message-ID: <e7d2e16f-6a0a-4046-8cd5-3682628443a5@ti.com>
Date: Thu, 21 May 2026 07:34:28 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for
 AM625-BeaglePlay
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
References: <20260514225502.2327771-1-s-jain1@ti.com>
 <20260514231442.D7206C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260514231442.D7206C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|LVUPR10MB997810:EE_
X-MS-Office365-Filtering-Correlation-Id: e15c6742-9904-49e0-2a75-08deb6dd4caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|22082099003|56012099003|3023799007|4143699003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Vrbc4yDYIuEz1O7z5NjUIfccgxULlX0kH4gR+ZhfJTcNnj3Fe8OPsWkPaf8aX0uLL/N0uT81xVSYQrE9CZvf7ucTeBUL/dFtj/86K3vYZdPak8jMTr1zkPahJywCf1wIWrIZxqdubtAMdttu1U0a0E/L2Vj+dSDLEN0wduqmRjSLuyYi98YcWJCIOMUktxOnhHz24oWORVgkJszsUEgo9mzvaMDVp0Qh9h1NHScbFfWPpApDbkwKrzvnfJlc9LmKgBO8jUUMGFu/Vv+6ESYIp49MYGGK58R0UplFBehAOD0r7pH4qjmzvsoYtJkINdoT2GylRRIyD+iyxnES6fl9Lc7G5F5N9AUOXg3T2SbeVOTh6ZIYKxZnmPZmm/DD6Khf7+u38D6aDtHFjUA3qRVB/9rd1QlN2VJDrWTazGm+x9WBnGhuLrsMuY3n1mpK6nNqFh8miLduIYa1JAOpxa67UDZrZLGFUCxJdvFbInoH3VOHCD9NoHjnpzqI+bnpb7YbgB1eHeEB0/yuxwRBXngOR9b7RRS3jtb4X3LQdprFxve3gfEVGE/uyo8QUL3HefPQ6jeYk+UdIpZDxmESPS5s3qDuLOfyGyARmDaK9zw9Mfe8lo0T0vs6AhntgzLV5bPyBX1bsKKDZu9Cjpjg/o0aIadef2JyFk92C4OdJkVVStkYjS3ALfhFEEvOT/5JeVan4ZQjl8uEFyE1YtaNKDU9F8HCWlCiv90UYucdekzczlU=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(56012099003)(3023799007)(4143699003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/+JjSGEseha2ry5Pg21XPno2Ng0AosuQB5peEzxNg/eQTd/Sl/tVVVNInlj9GH09z0C0rDoNUDdSclPXQKn9LxOisVx2ylnP+wIn7RTB0WjSYi84wpS80sOJgzLrRR++EfDUKGZEdl+gFH3NbK0i9iK1PJPhACcncFWxA8MT8HnD8F7GHRdfSGqZ0ZqR8sVro5H145Kn63ifXDWOmvbn8dO/10TfBaisXc6uGO1urFItKo9F9U4Ow0AQ/jt1lmoZmHRrseOqlh6SNiTsW1d7Ukyrsyl+TT/vCKLuTkpMLwkhJak0xo6rV+85KL2ahiyCHLqjNMnlViSu6JJEfbyCl/EnZcyehLnf6q+5rXxI9Blco32ZWSlz/qFY6l8lzKS7TJR1dCCVZe6t+bsrjaO6a6t1k4q4PWFdvmjIW67kwKZQ2rMDJ3HHqGNr+zyYQ5Ht
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 02:04:32.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e15c6742-9904-49e0-2a75-08deb6dd4caf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997810



On 15-05-2026 04:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Overlay-specific pinmux configurations are placed in the base board device tree instead of the overlay DTSO.
> --
> 
> commit 02fc98142af9446899da0e37e4dddce6f799d0a0
> Author: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
> 
> This commit adds a device tree overlay for the LincolnTech LCD185-101CT
> OLDI panel on the AM625-BeaglePlay platform. It configures the panel,
> touchscreen, backlight, and display subsystem nodes in a new overlay file.
> The commit also adds pin multiplexing configurations to the base board
> device tree and updates the Makefile to build the new overlay.
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> index c468b9c5fc09a..dc5b7f6217ad4 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
>> @@ -510,6 +510,20 @@ AM62X_IOPAD(0x0074, PIN_OUTPUT, 1) /* (U25) GPMC0_AD14.VOUT0_DATA22 */
>>   			AM62X_IOPAD(0x0078, PIN_OUTPUT, 1) /* (U24) GPMC0_AD15.VOUT0_DATA23 */
>>   		>;
>>   	};
>> +
>> +	touchscreen_pins_default: touchscreen-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 7) /* (A13) SPI0_CS0.GPIO1_15 */
>> +			AM62X_IOPAD(0x00a0, PIN_INPUT, 7) /* (K25) GPMC0_WPn.GPIO0_39 */
>> +		>;
>> +	};
>> +
>> +	backlight_pins_default: bl-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
>> +			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
>> +		>;
>> +	};
>>   };
>>   
>>   &mcu_pmx0 {
> 
> Should these overlay-specific pinmux configurations be placed in the base
> board device tree?
> 
> Device tree overlays are typically self-contained descriptions of the add-on
> hardware they enable. Adding overlay-specific pin multiplexing directly to
> the base board's file adds configurations for an optional add-on into the
> primary board description.
> 
> Could these pin groups be moved into a pin controller node fragment like
> &main_pmx0 within the k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
> file instead?
> 

Yes, it is better to keep overlay-specific pinmux configuration
with the overlay file itself, will be sending a v2 with these modifications.

Regards,
Swamil.
