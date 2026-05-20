Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD90A3DE43A
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280123; cv=fail; b=dxyU/JuKjuP9YeJwhmrKzbRlTh1Wal7iz2Z2kSySgF1hTD35PkDZotkzDqHYynMq+Vv+H1Oy81WES0spBWzJqVcQldqKWT0TZ5LT6qXtJe9LQQ1Ycw879q5+VyAqglYg6hpM1yDhjAkCHbvOw6fSYrmFpdF8+v7ErQOdP6ux6Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280123; c=relaxed/simple;
	bh=V6FueqW8OtgafjcxadfCQ5bZsBMnYPoNSN+z49fbL0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tboea7/XhGM4iYmsBCcy5eI19BXgtpk6huzTSBm2Z+i7Y4dbOAYeM4+DAku+Ky2Q1+94yNf6nizXfwaanpB554YhC0FcP/7/BvDdeEojLv11N2eCeA6DmiXxdVCnRMFzOZXoeE4tyUrc0yvQ92vGmJzm3C6wqRlpwWoAjHunTvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rY3YLaK0; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rY3YLaK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8+qOKc7zVPs6N0Flc8kaEwZJGY7x/HRnKt5UowsAJ0II0+60kWIN1SQ8Bg+Wf8WYRus47WBA6nT+CI6KHIvhaupQrRBX9QMYv01ruaiqyftjwvqPFCX2BSBJNXfz/ecgDX5fV+166IUmwv+EKI2lzunwPON06jC0AGJaE2E9P6GE8IWhhNEGWIW+F1gU92bWINUnIfULSwSJ2ZIrKpzj7r5rfhLb6evBxK23m74G8+U2ueh3M4kkCIedZbA6ML8shvylQ0ekahbM2Pc1Y19hqOgmhBInQfeFXlvkhKQU1QFe1mZawqOSiabY3BKe4yoaGIh1JkD8uBAs3fLSWhhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+wpWGDK4TRuCMJLhlIvlW1sgWDD20ATgBps5X334J0=;
 b=A/PQjqToMXL/o6Vp7X9vTqjrMSbarqXgBjCgp+3uD4FNvuOocRrTG8b1ashmMKYLvNImEvRWk4unKBpLlgOZHGRglAeX6OZQCQZkjUZrE2Inw1rkxl+ZHIJsjbSmu/ofU9uJytgoWp+l2otSI6GuOUd8+Dp5h6hM0W0CzYkAHa3TvSpFjkyHPkf+T4WADVP5Wt+TQKskOLGg5EeE5I+7hHpauX1Rgro+ddV6/FEj60PuVPJkTd3cIhfDFxfe/OIZOnrFDJhImQYEcGOgdkC3rSt10+fYDRCCUU+zso7Ia1V0rSUxTPw6kE6DOUUJdxng5CJSsq5zutl51KfWxA30Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+wpWGDK4TRuCMJLhlIvlW1sgWDD20ATgBps5X334J0=;
 b=rY3YLaK081a4MBVtGyF7NX7/pvyc36DqX5UVt6ieyFb+05SKAaDcXqWGdfCwA+utwVflW/7WTHgOTu2Yp5JzmyBXtQf2Xl4Tyn56xGpMD6mgznFpB0u/86cSahCEjmmHQ3rUKU3u03X20icWuFUSLcNLBvrWcVmq/0HCMYA1Vr4=
Received: from BN9P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::6)
 by MW5PR10MB5805.namprd10.prod.outlook.com (2603:10b6:303:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:28:39 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::8d) by BN9P221CA0013.outlook.office365.com
 (2603:10b6:408:10a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 12:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:28:38 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:28:38 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:28:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:28:37 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KCSYYN1433561;
	Wed, 20 May 2026 07:28:36 -0500
Message-ID: <bc1ad2af-ee4b-4513-a3d2-4d30c91d7278@ti.com>
Date: Wed, 20 May 2026 17:58:33 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: ti: Update audio-refclk binding and
 j721e system controller
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
References: <20260520115603.2662930-2-m-shah@ti.com>
 <20260520121900.50EDB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260520121900.50EDB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MW5PR10MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 58523e48-4368-4cb4-9d80-08deb66b51f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|4143699003|3023799007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zScHeGereOA5CB62nGnVXWX/n4PX420Z0hInjMMfHbIZbFdqH7EESv4i4548QhfNNYhJa7QuIHEooskJVcIJ0K7nmucSK/G6l1y3X7rCz1QX6nH5tBUFPoCUOuX98UxpiMsy2HIs3OvQeiGrYyiUjgkIH8E8RkKKJ4TKfTzfgBqMyVO4Hio/JeyMukFBn1VMTMzsUNbI6nzNR2/wajpbC1zxIrvi/eAZgGoIC0B3ijrYZl+YmPKLmWSG7sfIToRWyi9XEKt+3n4ZzPvQUniBmlwLX1/YwfrCgxwjTFEr15lVknnJIXlxhWsexAF5Jk3x4nmZNS3vej109UON4+UiAm2NgR9lr+g+UXLotRJkGG9eEiqYHAoOsnMozOwi7wVadadN9Cowgx2ZgEu1QBwwLyT5DrzeGy/I0i1dh0y6s4wJMgoQ9ZCqKToJM+nB28+8I2iQS6tPXtVLsDm7NUVxa0HmWVxhBaxTBak8KDsP7xgak5ImpfT9q0+rScugTAGpUBxl6pfZ7JTVrR52S/5K+44xC9g+rw70AVo406dmPWdNsSul256ZyVVe8rQ8haIstNluOxD8oGRWSm9sLA5T9Knv87wltvRDIzInLcM8S0dJiBjf7Lx2jhzN+SOBjtown38+dv8aj+dwXJ+RiehVsJvWZc+e+Lhj6/A6zHkgvUwfLQRIXLYo3EShhExQzpovopyhDpXNTrbdAwylL6eM22OLRaRyUYUBpKhfG7PEC9k=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(4143699003)(3023799007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	II8S0aJKipuaGNHbsMqpC4UADdM9gmeH8yg5ljnUqn+PzYVQe3hd8oDceznLcYGbKrgjde45JGz9mLluGWXfDqszfBhjnzkUTLvSUKf27jaytG08qlSmPZT5YdWoc7aZDhk2SEP0AJnIOEy9nYdVv36srPZd5WjHJ32K0r9B6LnZoQymBos8kfugJhqG12hdw+9y7HQna3iFzMq+bk6ImCn617w1OhC9XnsavVuWCpKmIG+sR0h35u18lylCBqeQp8aFOihO0/Z6AZc0hqfkxMexjAhviPJSyX13+Mfxq/nAnoOByV2W+O9DIX0wt9Fhpc4e8ouDJS3c3BWitrdoJvaU086qhshvu9WZ1QdVlPo0eTmetl+qBPXECm9IYaK6GhIzrwq3tJBilJ8Cp7NhF/fUXeIprgZdDBnFqYvN4SopqkuLEBGE0D0iK/ZVQxnv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:28:38.4953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58523e48-4368-4cb4-9d80-08deb66b51f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5805


On 20/05/26 17:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Standard `clock@...` node names for the audio reference clock will fail validation because they will match the existing SERDES control pattern in `ti,j721e-system-controller.yaml`.
> --
>
> commit e99145dc81945477b02ec4f36bbd799351ed4236
> Author: Moteen Shah <m-shah@ti.com>
>
> dt-bindings: ti: Update audio-refclk binding and j721e system controller
>
> This commit adds ti,j721s2-audio-refclk as a supported compatible string
> in the ti,am62-audio-refclk binding. It also extends the
> ti,j721e-system-controller clock-controller@ child pattern to accept
> audio-refclk schemas alongside ehrpwm-tbclk.
>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> index f3bd0be3b279f..364be49f8c7c7 100644
>> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> [ ... ]
>
>> @@ -53,9 +53,11 @@ patternProperties:
>>   
>>     "^clock-controller@[0-9a-f]+$":
>>       type: object
>> -    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>> +    oneOf:
>> +      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
>> +      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
>>       description:
>> -      Clock provider for TI EHRPWM nodes.
>> +      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
> [Severity: Medium]
> Does placing the audio reference clock schema under the
> clock-controller@... pattern force device tree authors to use that specific
> node name to pass validation?
>
> In ti,j721e-system-controller.yaml, the ^clock@[0-9a-f]+$ pattern is strictly
> bound to the SerDes control schema (ti,am654-serdes-ctrl.yaml).
>
> If an author attempts to use the standard clock@... naming as demonstrated in
> the ti,am62-audio-refclk.yaml example, does the node mistakenly trigger the
> SerDes schema validation and fail, forcing an inconsistency in generic node
> naming conventions?

The clock-controller@ naming in J721S2's scm_conf is intentional — it 
follows the existing ti,am62-audio-refclk.yaml example uses clock@ 
because AM62 and J784S4 are validated by different parent schemas that 
do not have a conflicting ^clock@ = SerDes pattern. In 
j721e-system-controller.yaml, ^clock@ is already taken by SerDes, so 
clock-controller@ is the correct naming for both ehrpwm-tbclk and 
audio-refclk in this context.

Regards,
Moteen

>
