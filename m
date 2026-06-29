Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766503F8EA6
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724385; cv=fail; b=cj23VFvbkmIlVJjCD8+paCyY1PDUNbZdms1GdlfXEPUg0T1evR9Ir5drGzL+hLSEXxm5SScPVh7jrE1T66xWbGAmq1F7DAfOAm6ywTXfIESyDgrKf4i6gPfQ7bSHRLzZuRmXGNFQu3RfgesJanUVqFNCpD2cF0+gqyIc01F6mn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724385; c=relaxed/simple;
	bh=hAiKE/tjjGqP7b9yLf1noMrTqrEa/G5l3y8Cw00sGUg=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DGWCCcUyd0YkhTKBADPL7InnmNWMyfK9WGzfQMTghcQm+35LVsJy5/Tc5uI4rTXvTEKIjdvk9nxw74KY9ayM/TGh60qEDR5gqQK+yMANs4+bDEqRM3OQzX8RpJF7OxEiyjWMi9j7CHAvNBC/iIdaObFmIQmC41pUKeXy44yIhWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=K6S+vBGk; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="K6S+vBGk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d547sAUUqZrDfKxnYXYnbwBFfwKrbumqGVMm7SDVIzHgHpw2qEWVfLATRwhKaQBbvgHuR0NUKk47bUO9Qo6j1zJ8lptAZ6KM2stgRQuVaPLYhRnxRhJ6wIPg4KQTeQtE4TDPzqKtGu4vUtdB5ADb9aHSph9jJnvn9bk/fo2T2HCN1SWTPPP2y7iz9ld00GX5lAqXshXQWnx8EWKLKSTx489SZQgy+WGwi+duW13uSDk1K6bR0DHez2r4QADw8O4P/0pnaAG+elB1+3TxonuS+tUj6boZ8V0Ih5G08OzMzMq01j/J716zKFiWeJf+Ef8eE4Sy37JDIilItxGz350ANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8Zt4gYXPb+idIvcPCrwGDWMCWkgI92ruPs7bFaPPCQ=;
 b=MmyWJIpngiMSIBlxast6gb0xcEdHOlZX0k09lQeWTjew7/vRTJrSBBZo68OoOpRf9gH+iYDOVc34rnuSG+t6n85V86ErjoT5dNc4sVWNz7B/ycbH5hiaKyVUvSBRQ2J3YPz3bIqpSHiW2xDpT45I/qtvx/QIQkWrxRPJTwz6cIDKzJ3pW3NzssYJfB/IjnXUS5G7Nuk4mO5iS6qJYPSF4DTc8C+s/DvEFd5JT3SSQEiUxVxtkT35A8AZhKTwki2ZHKVaV6qSpCzB2FSV7+l7Mkkiw9pZeYA3/FmUwvoIJDiwDug2QGzs/l5oNBtVBCIxXXgrHeFNmmg1nlYoUcWwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8Zt4gYXPb+idIvcPCrwGDWMCWkgI92ruPs7bFaPPCQ=;
 b=K6S+vBGkzYxmJQjl8OFGvO3EOZwLULbcFNBcMFtD3RlQ3r1GZTG/t4RdSdVRoJbb2jzq/zjnagNL/dcmoGTE3VOC3c45/ykjBbuGRVE0LtY9M5n/DcWUZ1Doe2BbjZmK3tNf6o5PLbM0rH3rEXJLt7fxIrTxItZGlyLnGumhZnw=
Received: from AM0P190CA0010.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::20)
 by DBAPR02MB6438.eurprd02.prod.outlook.com (2603:10a6:10:17c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:12:58 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::8e) by AM0P190CA0010.outlook.office365.com
 (2603:10a6:208:190::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 09:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 09:12:58 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 29 Jun
 2026 11:12:57 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: <sashiko-bot@kernel.org>
CC: <sashiko-reviews@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, <kernel@axis.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: supply: Add TI BQ25630 charger
In-Reply-To: <20260628220739.B37191F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 28 Jun 2026 22:07:39 +0000")
References: <cover.1782683551.git.waqar.hameed@axis.com>
	<3c28e53cff6d2e6ee94f8bf516ffa75134cb0959.1782683551.git.waqar.hameed@axis.com>
	<20260628220739.B37191F000E9@smtp.kernel.org>
User-Agent: a.out
Date: Mon, 29 Jun 2026 11:12:57 +0200
Message-ID: <pndh5mlemli.a.out@axis.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|DBAPR02MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5acaf5-88ea-4ad6-6b81-08ded5be9ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ubo9eJr+bVwSRsHKVDH2Qq9veRvb9yRk2FXY9Qg+sHkSKSAt3I7YuVyYWQtH2Vc/Op9dn28aLpaA0jD2fq77lpWtbAQpQXLkvNkC3RN4Ce+19Q41iswSoqKtNxnbuF+n4cRO5nNM2pONQ1rhORbQh8+om15lqJfXUqPmLQqZ68EkkQh3JawYFehyRvAbmP3CKr/d7wBtgN8rUG4lrAJ4ZDB6JHlhgmCnpyKyE2nG30WMKUqq2kH9K/5GZOdMP7QYcn18OWFmTjAR5eeLqeQPOpO48VGLNROiKUEazmM9dpnhVq1137kQ3zvs1ezYYz/2iss3HbMGh7FYxrTm+eJJDKI0zSxpWZ4FGBoPELVznM++l9ht19pxcYxdR3g4ocV/ecp1oX/MMMUEAig687PLX4y41jGpYPVVRmU2pccOTdQHkRp0yJK66fKsvTFX+ilypB2SVcPikvPnxqWAF82h4vfCUHLOA5+NbYNrhU24f95TnlRcIebu4zYqD+E1FVk29/wSkMAjKnyNoH8SuxHO17GEva+8ALUyEe7EnAMbYI2cm3kDe6ficrY3YV7UK2oa5Dcpa0sf/R8a/2hmkQM9se0F32rGWBr03FVFWeCwdtkw+2EOx0LwkcWeooH2q7HoehGl/X1Ysll8nlnVFV/4AzNr8H7B5xx1iugowWozGrKixn8YVysIn0an5ImzfwRd8cldtm8DxGVoU7duSDQa5g==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RVUvX2R8FeTvbqAeI4RyC4SMzuAjDdZ/8tyGIzsZNO3uEAFBvn06oEbXck3KCNYVpavKquyj4wRDjzrDCI4tZna221x+3tIpNlWUfl3CbR1SFVbftD4MI4Oi1pIKZ71G40UKS6W9QnloA+5T9SqRSqhzLRDc2RlCCIL2y0wcCa9rYoOE1zJd38DTlty6EX3h3bbBXVy7KNTSB4sKDYhksP6gtJIYihHoveEzF2ObBhO5R8xNyg6Mmx98elsx6i7SHUK+0xdZTMAqZnix7SM5LfGcsNTi15+tv4+yckb3hR7lxQPeQoOuSB3ApWv7AtKWb689OSgwmYyB9rWGWL9PMKxrc5dnLt05jVt/ueCFMoq6AgI/w8Dl2uX+TyWWUPTxWIxJEqMb6K9i3hB0bUpHdW8RMsRirPajpwB1UHOyBRAZWHk4OO4zZ1rRy4GAHI4o
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:12:58.5654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5acaf5-88ea-4ad6-6b81-08ded5be9ce6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6438

Cc: kernel@axis.com

On Sun, Jun 28, 2026 at 22:07 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The devicetree binding example references an undefined phandle label
> `&bat`, which will cause `dtc` compilation to fail during `make
> dt_binding_check`.
> --
>
> commit 4d0f17bc3ce487f6e8027b9ef945b17aba3d6bee
> Author: Waqar Hameed <waqar.hameed@axis.com>
>
> dt-bindings: power: supply: Add TI BQ25630 charger
>
> This commit adds devicetree bindings for the TI BQ25630 battery charger.
> It defines standard properties for I2C and interrupts, and sets up
> requirements for a monitored battery reference.
>
>> diff --git a/Documentation/devicetree/bindings/power/supply/ti,bq25630.yaml
>> b/Documentation/devicetree/bindings/power/supply/ti,bq25630.yaml
>> new file mode 100644
>> index 0000000000000..3f2904731c5a4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/supply/ti,bq25630.yaml
>
> [ ... ]
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        charger@6b {
>> +            compatible = "ti,bq25630";
>> +            reg = <0x6b>;
>> +            interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
>> +            monitored-battery = <&bat>;
>
> [Severity: Low]
> Does this example reference an undefined phandle label?
>
> Looking at the example scope, the node with the bat label is not defined
> anywhere. Could this cause dtc compilation to fail with a 'Reference to 
> non-existent node or label' error during make dt_binding_check?

No, `make dt_binding_check` passes. This was discussed in first patchset
[1].

>
>> +        };
>> +    };
>> +...

[1] https://lore.kernel.org/lkml/65f55d19b4bcf8f07300df5922ba1605bb669138.1772201049.git.waqar.hameed@axis.com/
