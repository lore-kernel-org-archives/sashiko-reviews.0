Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687223101C0
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112149; cv=fail; b=s9ac0HGEkYnDRHUoOa6IqkyvhYLTPV8WAR4xc2y+YQJRO+gKQ86vGWce3kFXUnfx9qNYPRs5hODZYutGWf+jnsMTVb175dl+FFY353/qojsni5WB+D5K2A1dDwdIEd61iUZtQlBUFmxxMW/2X3vrUjK+UOuGSp6Ep5V5FZxqGhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112149; c=relaxed/simple;
	bh=JyFNjZt9qc1UwmpnfI+4EvlBNJQrkoEq9Yb0qK1ZCeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bxVsfu5J347s9WB9wlz/C0KdrH2vQAQ20SYQGs+g4cZAtKaywttEglNRmLeu8pJIAW4ddjT0d3PmimI5Pti/1ClDwNtEAYyBgUYfQ0gTL2Z7e9AdGTiUFwBdhX9BdUfUNDkU+fxvfSPqxYww3skGM2wT/v4eiAxDbvXhOICJT5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=dk+GoqM5; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=ryzBJd2p; arc=fail smtp.client-ip=148.163.129.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="dk+GoqM5";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="ryzBJd2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=JyFNjZt9qc1UwmpnfI+4EvlBNJQrkoEq9Yb0qK1ZCeA=;
 b=dk+GoqM5m1mbGEUngm6if8I2xShSW7PURj4Qq3ps0WeH1ZCeX+Lo5aOxUbhr8840sQlZfbQkHka/I7J5nbLckV7xp3fLQtBdi3fccokODq064c+crKHEaJYLzf8YTDgG6y2Qgc49iE3Y7DdvycN6SMOQKUvgTNYdrrYWy+hLKtE2j0sSKfPMyVFje9ulGyMy1EKug63Do+8WPm+Fs/L1xorpqRDFCSOnLMe5YY1ilA4xi8yurgV3zCqOSJB58L9uAbWsI6xDgvp34Ba74NDeeEX8Ss9ZDZKNUJDXSUXmDEKCa9W/iXVM39CQOplRTIQ5iBSmK/ZE1AVuZ4WonSesXA==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020104.outbound.protection.outlook.com [40.93.198.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 794B7C006C;
	Fri, 16 Oct 2026 00:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzxLMPVXnNOyNNqF8teQhvFx2DbZD50LwnljU30IylC//3bqQZlRnRk5VEO0vogphkL4pkXWPLtktWE5nnPnBPp5UMLhDh6489eqLyU+cUtiJ74Mmc12CgzOV7MrTFwuzRUdorWbweskqsALaESW980OthI33K0K+1t6dmH7bxHMBX+g90OB5QK7pzxJMOmacCahVVzjiKsdKm1mmjkEvIJctfF5/s6v4+CPuVrTFwSARJUtydQjDnkbGphtekWy7lJF/Zwp4LLaurbPEqw1azCJL46/b9WbBPHKmgvW8xsjS7bYe56y2qdWIz1QqXtPrGoKXtweLdDorSY41BC1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyFNjZt9qc1UwmpnfI+4EvlBNJQrkoEq9Yb0qK1ZCeA=;
 b=uRZa1XfbZiHW96yeXAe3eu2IasQRZ6XJ6QySDgqVW2iUxpvvIM22pkyrhxR7jL8ffzzXaK++CTxLnXSksRiDmFbXG/LLeJvH1fLKul+sNYW+FdNq9gcFy7vJqIV/BfybOG3X5Cq/h1ZkCsyjjpXGuThy7GeF6yxp2IITO7MD82cuRztjWa/4uCm6QT+IBIm1U6vMaHC+fkJjofvR8vHnPXRhy1I0O6hbOr09Cbly+fWilhgYtRPdksnYEgJ/DtFE4MUEWQXJSXHQz4arMKn+n6l0BvAcd8Jqqpzj1ZhlUOkzp/cBWXllXhXy2mrGoMGfUYqCFlnxzWtgPiOUBi7d9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyFNjZt9qc1UwmpnfI+4EvlBNJQrkoEq9Yb0qK1ZCeA=;
 b=ryzBJd2poFbtEOiMjb/d70DRpsw4R7j9EykECXeOAh5Ip27/sj3rQCrKLgrCX0p8A9zO+jilVyuVPjyOYSswscDchLYT75y2an79fbw2UEVyuZy26CR+ShtM5ao6e6dxJAjP9PyaHwKIBk49wx7DMo2wnPgHPnX/67/74GNdx+pNg2iGaqX5cuiU0vWvi149xZhHwhHDD/X4eR6HHTUqzHlI4xQ9IPafeVr69TfZic28KKSp/uyd06yMUAaN3pfx+plZr8uilnQ/B5VBXBgeFyJYvF/mJ03RWgq0ahUVXzXfbHTszcYdJ/NVKV74kohNxBieYBwDmJ0YEWXhQBdwJg==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:44 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 00:55:43 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski
	<arkadiusz.kubalewski@intel.com>, Ivan Vecera <ivecera@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Carolina Jubran
	<cjubran@nvidia.com>, Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v13 05/12] dpll: sit9531x: register DPLL devices
 and pins
Thread-Topic: [PATCH net-next v13 05/12] dpll: sit9531x: register DPLL devices
 and pins
Thread-Index: AQHdW2QAhUmiPv7I8Ue/k9AppfvsxLb9o5mAgAG3vQA=
Date: Fri, 16 Oct 2026 00:55:43 +0000
Message-ID: <20261016005541.11374-3-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-6-arouhi@sitime.com> <sashiko-outbox-171990@kernel.org>
In-Reply-To: <sashiko-outbox-171990@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: 855fda0b-e786-4079-c03c-08df2b203516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|5023799004|56012099006|261009223027099003|4143699003|18002099003|10067099003|6133799003|22082099003;
x-microsoft-antispam-message-info:
 ONar80Vufc58HA+JhChJFWEfMi+xUAmo514qFEYhYZwDy27kR6w6echNBJljsDhnIZUBnhiRr6rcLx99oU29K4SuelbVasuXqGMzrfBu9rK6+CzPJNy34j78Zjo5L91xIaORCkqchPaRuoxXL1xDb6GVrQKsBEpZD2fp/2N8lItVjKJGZ2ZkAYRwnA+CuwRO4WbjwbBWWCUBR1AFe6m+1s6ExrmBH8zeg2jw3uSVQy2ajnFS23hBEcUr2pU+WJRjlumjVSk8PBFYgl/dQ6LXOc1Ysd0KPy1DAv/9bbuYROMbhTp4tRZlLc+CobO8v336ZxI0Q6FK7ovdw3iJO46/amqXxAWctKKzfAWK1kbKwJTPnRPKGRlPCT/JTUQDASMdRSefc33PVYgIp0bs0gfJP1LEYJWQT+xx5mCcePdfoKPQAWK0GFjBjztCntMRU2OCXepAsw/Pi3tA6oCaqdPM+cbt6N+tGa99FHr2DeFn51duQ18jx9EOTlMh8UJpo2qu+BuOCdpaXTiqqWpKsj5bp0y83p1P9p5n+va/Fg+/Rtv6WIVr0HPRcJjTVawZq2+9PgUPKPXzWja5yl1d6DmIIXpVmF3UMrO1Gfi/o+8d+BN2E5+MjwXtDNlbnNqqVLP8lzwxalj4rE8i+xhkLdq3b0r0yqXGNosrjM1CaB5nJ4drtob8pFgyBSIUGvMV5cYZhiM3GV+rJ/5OJrIh/TreL4xedeNZRoCglrxg6MxonxM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(5023799004)(56012099006)(261009223027099003)(4143699003)(18002099003)(10067099003)(6133799003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVpobW95bjg0VU1nOUR2T0RaZmg4TTZ5KzAwais4RjF2RklPWVBmRlFPeEth?=
 =?utf-8?B?TFVtUktnRUN1dlloUTJTVEMxbHczbGpuN2VqdG9rUktRd09pSnNWbENsc3N3?=
 =?utf-8?B?T2x2bXdabVIwVnJlMEQ3QzF2emRKY0RPb2trU2duZWx3SFhVc3dwY1JMS2ht?=
 =?utf-8?B?Q0FwUStibzR6UGVUT1JtOTBxMFplV2I3ZnQ4WkNVN05pS1ExVUMrRjlnT2Ri?=
 =?utf-8?B?NHo1bkxkMVlMcXBNKzdMdUtTSlkyaHVhN3ZML1ZTWVhYN1pOaG8vWGgza1Fp?=
 =?utf-8?B?czJ1Qnk0cWI5aTV0YzJMSTNJWVlwK21jSGxrRURlNUtSSUV6alc3YW9PTVdn?=
 =?utf-8?B?Q0hGaTYvVlRCMUE5a3JBdlNaUUpQZ0VxZ2tPTXhyZlJQNUZHTm5oUVkzZEZx?=
 =?utf-8?B?M0QzbndPUDNnVCtxUnpZcjJXOHZ0Tk9ZR0xZMllWUDMwbm1qaW5FY2JJSDBR?=
 =?utf-8?B?cW1tUk9sYXU5aTI5OGJkejRhdjBtS2N1RUZKZXBERk1DVXRscVVLWFVvMENm?=
 =?utf-8?B?azRHTzNFZ0N5RExwMzVrNDd2bU5NTkZwcGsxbGhuRFVBL1E2TklZUXBVVmpv?=
 =?utf-8?B?WmhXam1CS0pTZXduSU56eVhXQU5rVys2bHhGUHNtOFVQaENFU01WV21WWjVo?=
 =?utf-8?B?MzRNaFgyM2k1cDIvUVdCSk5FNkJPU1JMcjQ1NllXblNFbWFVUTVQeHNpcXhP?=
 =?utf-8?B?akdPNzFPTlI2Z0RIR1VYck5qdDhBSUFqOFgzMXVmc0RXRjZpUVhFRGZTTjFn?=
 =?utf-8?B?VFJoUktLSnd2N3oxVGE5dDg2Q2VFOWRlN0g2V1RHK21zTWNGYVZodk5rL0tz?=
 =?utf-8?B?V2tJbDVXTjlTY3FMOFhXNGN3T1M1SGxxaDd6Y1pScmZvanFVeElUdFFIR1Bk?=
 =?utf-8?B?eU5BWDY4QnNRelNOVUtQQ2tHMzJ5R1VRYUpkY2k2TTUrdlpaVlJZMGF4aGh6?=
 =?utf-8?B?Rk9vaVA1VE1jTHlCd1RhUC9FU2VzVlRmZVluRVhHUVUvSUpHeGgyRjNlOVJu?=
 =?utf-8?B?NFZEd3hsQkpjQlFPTkswU1M0c0pzUXlnY0RHbVhCQ0U4ZHc4T01MOFBwcTdy?=
 =?utf-8?B?eUh3V3Zrc053aTU0cHVDNkxyOGRQQlBrR1ZVclVqYmtuUVNnK2JMSzZITjIr?=
 =?utf-8?B?WG8yNmhqcStoMnRHdUpSejJ4QzA2ZHZVVGxzSlFzRzJxMGNsN1ZjM1BpV3lr?=
 =?utf-8?B?Ulh6YTVTMmNkYkY1RUkvcmo3cTU2OUNHQXQ3QXNtNnZZcEZZLzR2Y1pOaG1Z?=
 =?utf-8?B?cFlSaE4ySGZUZDRXeVN0K1ZzcDFJTk1mbXpsTWF2L2VTNVVjdEExMFk0YUlz?=
 =?utf-8?B?RFNjL1RTM0diQk1vNWcybnZzeGxENmthMGtQN2V4UHovUDg1cTlkUXlyMTRC?=
 =?utf-8?B?U1kxeUIrNnQ2aTlvajAyZm9KdzdORzA3am9wbEJNOHRpOGVWaEdMY0FVNXVJ?=
 =?utf-8?B?NXdKUUErKzQ4a0pFRmFCL3pKQ3AvRXBaaTh6Z1BoSXFmVWdkQ3gyWFlzRG1a?=
 =?utf-8?B?MEZ5MEZoYzhlME9hd2NPdkxvQklSVTlRYzRXZlhEQVFFbHhIeEVXNGhBRVVO?=
 =?utf-8?B?Ky93VE9Hc3VHcWMvdXQ5OW5idXhMek0xd2tFRTFmNElJRnhTNFpXSFJGd1dN?=
 =?utf-8?B?empmOWNNK1BRQlNzN3cyUmYwV2dZSHA3aGtkYU4vQlpyTncyQjhFdUZVVzhp?=
 =?utf-8?B?QllURDcwcGlldktjNlF4WlAxaU9RRXZvN3g2alpVaGNZWUdBcTViemF2Tytl?=
 =?utf-8?B?b2NDclNhWFpTbTVFVi9CVUxBUE1UZU4xcWdHOGZLOGRVY2Y1UXpzdWMyMktY?=
 =?utf-8?B?bm9TcnlpNTA5aDR0SmRBdmdqUENnUDN5dW14K3BFTmF5QjZWc3dtRWhFZjdC?=
 =?utf-8?B?N2ZiUWphRU53cFdZUHlqK3ltNjBOK0VmcVlHOWxEbXlSVXBOZ3hCV21jNTJT?=
 =?utf-8?B?Q0pRZUFtOXdzU1RuVGRUTDZDNDQrOFF0MkZrRzJ5ajB4dFkyZmpzaGQ4UmVk?=
 =?utf-8?B?dklqRTJiMks1ZldtamVvRXF1bXRhWCtPWUdIaHFpT1R4RjdjNzJ2VGtQVjVq?=
 =?utf-8?B?empvYVRZWEZNekZGUTZKeUo2RU5HSDBJellUcE1xWm41eGxRZ1RCdzBUamVY?=
 =?utf-8?B?UlhWVTYvUk9rbklDd29VSjJSTnBqdzh4b2dXNDFNZ1M4NWJnVWpIVW1EOTFs?=
 =?utf-8?B?aTZzYzkxU1daWUVuWXI5TlBzY2V3MjU4TkJLdTByYXV4SXFJdDVqNHU5Sk14?=
 =?utf-8?B?YXcwS1J0dmtWT0tmTlZqdXdqc3dyOTBtRklGWllkNHl3NUhPR3dtR1FoZEho?=
 =?utf-8?Q?BCdNLymboEXr1f/9JA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	H/kevsqQaDAlbbEYxSSsKoKbMlGaNGPTwP27Ta9w4lOUwEvJAJFCC8VM7hXaD5B7yU90LP8AzX6WBCi/j+cKWDJAyCGmaajqOJxR27jDm49lbrSO+OixMUWollMAbd8inBj15ugPz1vGPtldiNn44svrTifpBFBQdkBt5/fpL6UU2CEobHigBe1ousynCq/RF2oxFLviiRfC1K+aID4M+HBX5lEegri6gM4/Ik/vAj3UN3HsfiNvC3+ZIUE3JkXWtm45vbPPK0R6bNmjiMHke5m1AdACJj+AzRvyYISiyyD0V/aC1OIrjJdOKapnMjBiNbbpkAAUS/ASaSXQti6NhQ==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855fda0b-e786-4079-c03c-08df2b203516
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:43.9414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5x513KRyI81Uwzfq5bJT0Uzh1T0OOoj2nrjax13bKf/1LGGU+GsFmyBE+Uv/NXmJMrUpD+m+5Nv/M+r9wMN7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112147-lFxaTRrbE6_L
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112147;lFxaTRrbE6_L;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLg0KDQo+ID4gICAgICAgICAgICAgICAgIHJjID0gc2l0OTUzMXhfY2hhbl9zdGF0
ZV9mZXRjaChzaXRkZXYsIGkpOw0KPg0KPiBbU2V2ZXJpdHk6IExvd10gc2l0OTUzMXhfY2hhbl9z
dGF0ZV9mZXRjaCgpIGV4cGxpY2l0bHkgaW52b2tlcw0KPiBzaXQ5NTMxeF9wcmlvX3RhYmxlX3Jl
YWQoKSwgd2hpY2ggaXMgZG9jdW1lbnRlZCBhcyByZXF1aXJpbmcgdGhlDQo+IGNhbGxlciB0byBo
b2xkIHNpdGRldi0+bXVsdGlvcF9sb2NrIHRvIHByb3RlY3QgcGFnZWQgSTJDIHJlZ2lzdGVyDQo+
IGFjY2Vzc2VzLiBJcyBpdCBpbnRlbnRpb25hbCB0byBvbWl0IHRoZSBsb2NrIGFjcXVpc2l0aW9u
IGhlcmU/IFRoZQ0KPiBhZGphY2VudCBsb29wcyBpbiB0aGlzIGluaXRpYWxpemF0aW9uIHNlcXVl
bmNlIGFjcXVpcmUgdGhlIGxvY2sNCj4gYmVmb3JlIGNhbGxpbmcgdGhlIHN0YXRlIGZldGNoZXJz
Lg0KDQpOb3QgaW50ZW50aW9uYWwsIGFuZCB2MTQgdGFrZXMgdGhlIGxvY2sgaGVyZS4NCg0KVGhl
IGxvY2sgd2FzIHByZXNlbnQgb25lIHBhdGNoIGxhdGVyOiBmcm9tIDA2LzEyIG9ud2FyZHMgdGhp
cyBsb29wDQpydW5zIHVuZGVyIG11bHRpb3BfbG9jay4gIFJlYWQgb24gaXRzIG93biwgMDUvMTIg
cmVhY2hlcw0Kc2l0OTUzMXhfcHJpb190YWJsZV9yZWFkKCkgd2l0aG91dCB0aGUgbG9jayBpdHMg
a2VybmVsLWRvYyByZXF1aXJlcywNCm5leHQgdG8gdHdvIGZldGNoZXJzIGluIHRoZSBzYW1lIHNl
cXVlbmNlIHRoYXQgdGFrZSBpdC4gIHYxNCBtb3ZlcyB0aGUNCmxvY2sgdG8gdGhlIHBhdGNoIHRo
YXQgaW50cm9kdWNlcyB0aGUgY2FsbGVyLg0KDQpObyBzZWNvbmQgdGhyZWFkIGNhbiByZWFjaCB0
aGVzZSByZWdpc3RlcnMgaW4gZWl0aGVyIGFycmFuZ2VtZW50Lg0KUHJvYmUgcnVucyBiZWZvcmUg
dGhlIERQTEwgZGV2aWNlcyBhcmUgcmVnaXN0ZXJlZCwgYmVmb3JlIHRoZSBwZXJpb2RpYw0Kd29y
ayBpcyBxdWV1ZWQgYW5kIGJlZm9yZSB0aGUgaW50ZXJydXB0IGlzIGVuYWJsZWQsIHNvIGl0IGlz
IHRoZSBvbmx5DQpjb2RlIHRvdWNoaW5nIHRoZSBkZXZpY2UgYXQgdGhhdCBwb2ludC4gIFRoZSBw
b2ludCBzdGFuZHMgcmVnYXJkbGVzczoNCnRoZSBmdW5jdGlvbiBzdGF0ZXMgdGhlIHJ1bGUsIGFu
ZCB0aGlzIGNhbGxlciBkaWQgbm90IGZvbGxvdyBpdC4NCg0KPiA+ICsgICBwaW4gPSBremFsbG9j
X29iaigqcGluLCBHRlBfS0VSTkVMKTsNCj4NCj4gW1NldmVyaXR5OiBMb3ddIElzIGt6YWxsb2Nf
b2JqIGRlZmluZWQgc29tZXdoZXJlIGluIHRoZSB0cmVlPyBJdCBkb2VzDQo+IG5vdCBhcHBlYXIg
dG8gZXhpc3QgaW4gdGhlIHN0YW5kYXJkIGtlcm5lbCBBUEksIHdoaWNoIHdpbGwgcmVzdWx0IGlu
DQo+IGEgYnVpbGQgZmFpbHVyZSBkdXJpbmcgY29tcGlsYXRpb24uIFNob3VsZCB0aGlzIGJlIHJl
cGxhY2VkIHdpdGgNCj4ga3phbGxvYyhzaXplb2YoKnBpbiksIEdGUF9LRVJORUwpPw0KDQpJdCBl
eGlzdHMuICBremFsbG9jX29iaigpIGlzIGluIGluY2x1ZGUvbGludXgvc2xhYi5oLCBhbG9uZ3Np
ZGUNCmttYWxsb2Nfb2JqKCkgYW5kIGt6YWxsb2Nfb2JqcygpLiAgVGhlIHNlcmllcyBpcyBiYXNl
ZCBvbiA0NWFkODRkMjgwMGUsDQp3aGljaCBoYXMgaXQsIGFuZCBldmVyeSBwYXRjaCBidWlsZHMg
dGhlcmUgd2l0aCBXPTEgYW5kIHNwYXJzZS4NCg0KVGhlIHNhbWUgYXBwbGllcyB0byB0aGUgc2Vj
b25kIGluc3RhbmNlIG9uIHNpdGRwbGwuDQpUaGlzIGVtYWlsIG1lc3NhZ2UgYW5kIGFueSBhdHRh
Y2htZW50cyBhcmUgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IGFu
ZCBjb250YWluIHByb3ByaWV0YXJ5IGFuZC9vciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gdGhh
dCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3Vy
ZS4gQW55IHVuYXV0aG9yaXplZCByZXZpZXcsIHVzZSwgZGlzY2xvc3VyZSwgY29weWluZyBvciBk
aXN0cmlidXRpb24gb2YgdGhlIGluZm9ybWF0aW9uIGluY2x1ZGVkIGluIHRoaXMgbWVzc2FnZSBh
bmQgYW55IGF0dGFjaG1lbnQgaXMgcHJvaGliaXRlZCBhbmQgbWF5IGJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5k
ZXIgYnkgcmVwbHkgZW1haWwgYW5kIHBlcm1hbmVudGx5IGRlbGV0ZSBhbmQgZGVzdHJveSB0aGUg
b3JpZ2luYWwgbWVzc2FnZSBhbmQgYW55IGF0dGFjaG1lbnRzLCBhbmQgYW55IHByaW50b3V0cyBv
ciBjb3BpZXMgb2YgdGhlIG1lc3NhZ2UgYW5kIGF0dGFjaG1lbnRzIHRvIHRoZSBvcmlnaW5hbCBt
ZXNzYWdlLiBUaGFuayB5b3UuDQo=
