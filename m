Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A572FD7B1
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 00:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792112147; cv=fail; b=kVrO/Kk0z6jcn6VlN95zM3EMWMmGAX1wb2ljGI94zpPUsY9203mxowVJR1T9fiRU1uSlf3dpAu7Ou1KYYjIAR4HNUemjjDBgVGyLKY20UKYDZKUfO4+5iO1p40qrONL34XmA40P1SDgarzuZPfjwmyyQYw215ZUknAbU7Ca8jJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792112147; c=relaxed/simple;
	bh=iugCs6Z/rcaq4LOcgsWGOFWCn6T3cTAtmTURMo6+hTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kLwKsIYxTKrMO9W3SsX81HwAj1R4+71ZYRg76BU/AthUuDk1YHdSqoDFFDMdIcsLygx3P/YNwR4lJ/vys1lUvFyZ4D+4QfrfgUSTfUK08EHJS8Wx+FGd21F0Pq5JiysiB1kBVJNq5kv2FEZ5fc7i3TvpEyyhORr2gBv/oGL8+XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com; spf=pass smtp.mailfrom=sitime.com; dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b=ldiO/H0m; dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b=z3hNsRQM; arc=fail smtp.client-ip=148.163.129.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.b="ldiO/H0m";
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.b="z3hNsRQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=iugCs6Z/rcaq4LOcgsWGOFWCn6T3cTAtmTURMo6+hTI=;
 b=ldiO/H0myxcvvJ+pbPNe80q1TroD8YJB6AEEa/MKvtWNNXhfTYXsWaY7C5THj4H4CacSAGZsO7V7VvNw+kd1fvzCVBgYpGcqsmHabjbCfw9UMJLo+tDcnsLB/eEP5C/UV+J6/ndYXj0ifVuKVVb/Lyh+usHVCZaa0D1yXZDUhLl5LGJHgwLEB+CJUPR0l/SxCM6kkft6ZYe/CkW8UIx567ZsqtRqH6vgLKqdTT39/D5ojObv6yJZkkIpRfbPz6HosYqX1xeVuvWtXjOf3QpK1Ec+vLEKReSt8fz3R8LUQHbX2fSFwOP7qxbuThoj+wYHY2hcPjiC5C2V5HlWa2mcKw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020125.outbound.protection.outlook.com [40.93.198.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 92DB4C006B;
	Fri, 16 Oct 2026 00:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAS/Xnzngbzdevwgl6TLcwHYkTcZ2tBRBQM10cBTBbdhwwMGt5M8c+Yw3bK/Rpx4NCmRSSRMgfBn5CjByG/Ymx6b8jY1zChGTtcZI463CX6Gn0d5+GZRRQTjirToRhFVla9I0J5AgF93GqPST9pobfEs8Bz8NyKqhDtlch54HPWhPZWnP7rNXc2BkqmLz5QuhY/PfPh5X5Lv4zoCeddiBu2BJlMsZV4cZDTEXklElI4Eji6oIMYbmrw3tqhWlM43YVm2l4FOjirRPfUMXeaLvi09OehnzZkvmKw8Xu74ET/qFM3jGtOPa56bXNZUitBsj69BGr3SXfK4CK2+LRb7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iugCs6Z/rcaq4LOcgsWGOFWCn6T3cTAtmTURMo6+hTI=;
 b=Mq0qbVW5JkuPlMIjIzFDRQX9F+LLBdWCP85F2fE9ICDlovvg40AKh1nFRcQX3HqLU5Ei6D4XP0gHZAJzc2xAljGeH4CIJLecy3NqNyfIdu5ny32Pfts7m+Zk6FT6yDq0xLyeG6SD5aZDraP8VQOLQSVzxV3w4ZeDatspvcUwSFWjSG+mHl3AZ40+pJy4nKgWmdm8Cfl6dil2Fcquk1pizW0X7FUej/KFR5/KPODAe61NMBi8/cBc2BmWGjhQ+9yKWaC5AXYpzRiuS5U+JYMtOBVqDwv8z7yPHay08B0QMue0xJiEZo1C25bcYQKMhrv+aLxU/uXpG4HL3Q9YwyuGPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iugCs6Z/rcaq4LOcgsWGOFWCn6T3cTAtmTURMo6+hTI=;
 b=z3hNsRQMpHAb32EQ5z9cdLVbV8Wy19UUs7nncTkrFGoooIw3hpe8uISx4Y/qyUrkL+XmkKYm5iBZmpKnc0aNlFOZ2+PU9xEcuhWlutPIC/gHZPjAjxpCtIKLqE5We4gsVoXWDv2hoirc16BDDZ9ULTI0bchXlBorYXqdMzYEzQZEKxeqNfIoANY3vWR+WP4n7JSkFGDPtfr6thV0CGJvO0fA3b7k8O8quO4eddSzsm4rLz+BZEog2vbwaqftQyRwGyU6WJ76ZAqO9vqnaSpgeio9bdAf+99eV8thuvbsu/EGehJlkPtb2kosI/z9ABfZP050DZnDLPtUbSolruVvaQ==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MN0PR20MB4789.namprd20.prod.outlook.com
 (2603:10b6:208:3c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 00:55:43 +0000
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
Subject: Re: [PATCH net-next v13 04/12] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Thread-Topic: [PATCH net-next v13 04/12] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Thread-Index: AQHdW2P/0OEhu8U9dkWPN9oKD82kLLb9o5oAgAG3uoA=
Date: Fri, 16 Oct 2026 00:55:43 +0000
Message-ID: <20261016005541.11374-2-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-5-arouhi@sitime.com> <sashiko-outbox-171991@kernel.org>
In-Reply-To: <sashiko-outbox-171991@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MN0PR20MB4789:EE_
x-ms-office365-filtering-correlation-id: d16caff0-f7d3-4fdc-cc75-08df2b2034b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|4143699003|18002099003|10067099003|22082099003;
x-microsoft-antispam-message-info:
 HBztbMs14y6Gs2bHvjpOOCFNno6F5XB7Lxhb75kHcOOxGDBlTtNcMPzj1/NK4krTkJj6cq+1zzcg9iKhJahvIPdXykrXG5aaLNgMqoXNNrNggDA0IDSVt6nI+t7lxjWV8YZwkVDX3P08KzXgoPgmaLw9eWEUDvNwE1W8u+znKzeUn5fOx/hKi/SLTlhlJDHXiMN+TkUq9tSKp1RyJnN7rrtC77CDidW2pz8GTQJs5Ao0NN12Xs8jonFOThQYhoujlAM5ARW85kFct3k0aHmVuSDoASYLN74HwMDP3rWC6HOvv17lMGoxFrA4WuoLyXfWFI+n+uX/DIOXFA0OvoH2aSVlL0p1H2cIGwqha1qb5E7frIRkIWPdiqRpoSfrjd5N1sAbYLVFPD7S25vtQ/qYcGiFcJogJ/uoFEMtUBqjCPWavlzvvczEqd4FBFLEFpEpx41fA5O15k9I+aAcpgbmipLKak2U4J60F7KbiE1Dy06dxLdXnEDJr84Muj6v1LBiWy5cO2maisAv6hzzOXbEZ8fwS8A7EwVjyNYX3VVmO9z477/VT2HZEEiAWSUsWk+CBLCmmah67ineLghC9fonjBwdEOxYvAsBi2M5NUEQvsF+vjrTkE1SdR9BSA6aQLybaTAmQb4D1pD/H7G1F08pqMF0Z1vzN+xmjJmQujDeCqO7ByL4NeTYsaJWDES+aHScWdihoZy/kF7esiVC/Bpeg9HSQ1lHXH4UWdMk++LrRGY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGxUeGRyVGdPYmxGTEpiQ1J6dG5xcHNRUUI0UXNBVUVaVnJJTDhXdGJjT3dh?=
 =?utf-8?B?N0pXdDFKamRLYW5McTZZa2tHTHlCSzNURWtHRmdkOWdoaUU0M3QxVGl0dnNV?=
 =?utf-8?B?VUZCS3ZjY2lGSm84LzZGUmQvemdDTk5tM0tZcGZDWGdmaUpLU1hPaTBJakRn?=
 =?utf-8?B?OHo3dTF5anFweTk5Q0hEVnZmY3hWMkZCczVuYTcxa3hyTWdQTmtZbitnSFRK?=
 =?utf-8?B?OU1LZ0ZjNmpMcnFFcHZqckhCUjU3VGlxNGdGUWRDM3haRGliN1VxakxPZG03?=
 =?utf-8?B?bHB5cDVRTGxGekk4TVhxK05WQTEwR2tPSHJqQmJPM3JBUkhKTE13STl3d0lG?=
 =?utf-8?B?enQ2cVJyTlZKN0FDdnN1a0NyNkQrQlIxNE1rVzFmSlN2NDRNN1RlQnIxdGdH?=
 =?utf-8?B?RG1EMlVMOUVhRXhkYm1yK1EyOHBDdk0zWGxQKzgweW9WTGRzZUJBSUV0S1Vu?=
 =?utf-8?B?RzN4WjBJdGRkVEFrYlBOL2hrdTBMcUg1MmdZbjE4eHNkV1pEdjBwem0wL2Jj?=
 =?utf-8?B?SzhmaVVuRXZ2U0FXaGFac3JhMVRxMEVXc0F1cVVsOXhqcDdwTFNnQWFiY1li?=
 =?utf-8?B?WTRoQkRXZFVZYjRjbnAwZ0ZyMTdGNjZXeGV1Ly9FcFNmZzhWWTZpZEpkT0ZR?=
 =?utf-8?B?aVoxNTBFWm43d09kNkp3RHUxWG1MdjlKOHBpMDFyRWxtVnB1T2JLSlpKMUI2?=
 =?utf-8?B?ZnRhMnhBWUVDZy94Y01ldGRML2MyUG9sWkdJanR6K0RKU0k0b0F6ZHJsVTJu?=
 =?utf-8?B?akdIdDFmU1JtMzJWMGpHTnNwTEgzc1VQbktzZFpZTjc3NFU4b0MzQmEzbksx?=
 =?utf-8?B?czVXTHMyN0lZTHE0RkgrWVk5ZExUdmF3NzlmbFZMNGVWM3JIS1JRcTcrTThs?=
 =?utf-8?B?Y2ZodWt4VkRqQ0hVTTFyZjcwNER4ZC9OdzRMMnh1YU5UbDdzNUZMSmhyQVJk?=
 =?utf-8?B?WkVxemhhZXNCeHArZ0FpZFYxb09RRktMU08vN0pDTUtqVzA1RDBKeVdGdEFx?=
 =?utf-8?B?QndqWnk5dGlVNTlXWHArbEliN0pYM2IxL2dHaWM0bWxQM09IMHdUd0FaS1Jq?=
 =?utf-8?B?RHp2SU5hVWoxNkZiQ2VPQ013ZGUxWStjUTVjeXRtNzhleENOaUNGaGRjc2t0?=
 =?utf-8?B?MWcyaklDeFRtOWJFdm1mY3FJdm45eTRLWHlucmV3Zk1PWG9obHN6QzAyQlgr?=
 =?utf-8?B?VExqZkdWY3pkTjhVYWtpRG5zTWhSZmZCUXc1UTlXZDNGeU5XWFphSHNheWlm?=
 =?utf-8?B?SXV1TlNreEFBTFZpQnM5YXI2dTI2Vkk4anpIMUp0dTROTjFOZmtzV215MjBm?=
 =?utf-8?B?YzVFZG5OeTN3aGplYkNibGdCZkMxQjRWbU1Tc0U5Tmh3VHlNSkg2enR4b0xm?=
 =?utf-8?B?cW5OTnVzQzZaVlMyZkJVU1lkWUtpbmc1NUJCMTdRdWlqcm1POXd6MWswUDBh?=
 =?utf-8?B?WWxIT2NPYitRV2t2Q1J2MGlEa0tXZk1vZFdsUCt6dHNmYjFFVDBMQS91Wnlx?=
 =?utf-8?B?NllGNzNRT3dpT0RmNkx6em11dDF1Vlg1dk96T1dYenRVU0xCR1pvcS8wQjZm?=
 =?utf-8?B?aDV6aUFSZGdHYUJjZVlveUtNT2VSY3dKR2xLa0c2NDFsWFJuTGwzeHFBQ1JV?=
 =?utf-8?B?WTQyVXVibFZUd1FQTXN6cGJkR0M5OHFDeDMzK09mTWVyVFdXaTVzMTRuTGhs?=
 =?utf-8?B?cVRmZ3VldEV3R08zaXE3cnZsdGhZcnkyU0d4YlFhNEtHK0NFUEh2TXZFZngw?=
 =?utf-8?B?Y1BBdllzMEVGTFJocEpOUWhiMlU0ZitlS0JrQ2U2d2ZENXB1anFMSFoxblFD?=
 =?utf-8?B?ZzMveUR5V1VTY0VTQ081SkRGN1YzNHVRcGdpRmdvaHNXbm56Z1AvaWJJSkhL?=
 =?utf-8?B?ZDlIUVQ0YUpzNkYrazlPTVhDQ2dSa042MTRoU2EyVlZ6dFByNFFtUlM0OXRo?=
 =?utf-8?B?Tk5qcm1tNnJja20yeGlheDJ4aWNaY1A2SSt2YlNWZFlGK0haaHl4b0FoaTVh?=
 =?utf-8?B?eVB4ZE5lTWlPQSszRG5Vbnpsb2tPeWdza3AxYVpCZmpjWVhHNjlsTEhVb3ZR?=
 =?utf-8?B?aHR0N0syMmdLMzRtcFJVSUhoaE05U2ZqS2ROQjcrRDBOSTJDaUY1NTlqM0ZP?=
 =?utf-8?B?Ny9mSnNYNm50WnJCenhUWjE2K0x6ekl0V1RJVmtDVEZEMkJ6QXpjdDB1cnlC?=
 =?utf-8?B?aU1obmkwYnpNZjUrbUdML0FYR2lsSmNkd3hIeFZyTW10WkExUno5U1VsVjBZ?=
 =?utf-8?B?anlxOFRRZU0zeklaUEpuYjFUc0pjTWl6OFF1Y240YUV0aVI3SUxDU0hkaWxa?=
 =?utf-8?Q?ZyFAo3Y5fQHoyRVGmP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	UXhIVy601AgP3IO+xixnyKIzA/Fvwacfqrbt0B1p/F/SrEvy4Ag7/dCNMPK0PAEeECjQ3/KyJKfO5PIfJJtUSqshtTN/GCaBujKdZs73anFqeN1Rp1tGXhqBYT8TNqKlK4BbHa4F/dg9SqPxcQne24zPMd+/MmWZMlWNFCo01W2QKxmDP8FVPxIW+o3vMUshymvkbQRWEKN6Q6eHi8ov3d2ZHddZXrlBZt/IMKbkOO9tvfR4HGLZsZmRbPBZGnmBT3lF678eeM82alzgxcWdhKhp3OIyE08z6bWxd4Z7mb8+zDzTXEm+pM9vW5KECenwNL+LxitrUEjHKLY8EI+1FA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16caff0-f7d3-4fdc-cc75-08df2b2034b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 00:55:43.3188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6bcY32PhA5QW650zwI6B3ck8vECB/Ewn4gGTMPp6lXFx5nPCNrNbaPDoFw3NbDlUHDj39bPXc3WZqPMQyo4wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4789
X-MDID: 1792112145-Ej70BwOyOcD7
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1792112145;Ej70BwOyOcD7;<arouhi@sitime.com>;b258b95cf5ef1e870c44c71acb0e4bbc
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gV2VkLCAxNCBPY3QgMjAyNiwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCg0KUmVw
bHkgaW5saW5lLg0KDQo+ID4gKyAgICAgICAgICAgc2l0ZGV2LT5yZWZbaW5kZXhdLmZyZXEgPSBz
aXRkZXYtPnh0YWxfZnJlcTsNCj4NCj4gW1NldmVyaXR5OiBMb3ddIERvZXMgdGhpcyBjb2RlIGxl
YWsgc3RhdGUgaWYgYW4gYWxsb2NhdGlvbiBmYWlscw0KPiBsYXRlciBpbiB0aGUgZnVuY3Rpb24/
IFRoZSBjb21tZW50IGxhdGVyIGluIHNpdDk1MzF4X3Bpbl9wcm9wc19nZXQoKQ0KPiBleHBsaWNp
dGx5IHN0YXRlcyB0aGF0IHRoZSBhbGxvY2F0aW9uIGZvciByYW5nZXMgaXMgdGhlIGxhc3QgdGhp
bmcNCj4gdGhhdCBjYW4gZmFpbCwgYW5kIGEgY2FsbCB0aGF0IHJlcG9ydHMgZmFpbHVyZSBtdXN0
IG5vdCBsZWF2ZSB0aGUNCj4gZGV2aWNlJ3MgY2FjaGVkIHJhdGUgY2hhbmdlZCBiZWhpbmQgaXQu
IEhvd2V2ZXIsIGlmIHRoZSBhbGxvY2F0aW9uDQo+IGZvciByYW5nZXMgZmFpbHMsIHRoZSBmdW5j
dGlvbiByZXR1cm5zIC1FTk9NRU0gYW5kIGxlYXZlcw0KPiBzaXRkZXYtPnJlZltpbmRleF0uZnJl
cSBwZXJtYW5lbnRseSBtb2RpZmllZCBmb3IgdGhlIFhPIHBpbi4gU2hvdWxkDQo+IHRoZSB1cGRh
dGUgdG8gc2l0ZGV2LT5yZWZbaW5kZXhdLmZyZXEgYmUgZGVmZXJyZWQgdG8gdGhlIGVuZCBvZiB0
aGUNCj4gZnVuY3Rpb24gaGVyZSBhcyB3ZWxsLCByYXRoZXIgdGhhbiBkb2luZyBpdCBlYXJseSBp
biB0aGlzIGJsb2NrPw0KDQpSaWdodCwgYW5kIHYxNCBkZWZlcnMgaXQuICBUaGUgWE8gYnJhbmNo
IHdyb3RlIHRoZSBjYWNoZWQgcmF0ZSBiZWZvcmUNCnRoZSBhbGxvY2F0aW9uIHRoYXQgY2FuIGZh
aWwsIHdoaWNoIGlzIHRoZSBvbmUgdGhpbmcgdGhlIGNvbW1lbnQNCmZ1cnRoZXIgZG93biBzYXlz
IG11c3Qgbm90IGhhcHBlbi4NCg0KdjE0IGRyb3BzIHRoYXQgYXNzaWdubWVudC4gIFRoZSBYTyBw
aW4gbm93IHRha2VzIHRoZSBzYW1lIHBhdGggYXMNCmV2ZXJ5IG90aGVyIGlucHV0IHBpbjogdGhl
IHJhdGUgaXMgc3RvcmVkIGFmdGVyIHRoZSBhbGxvY2F0aW9uLCBpbiB0aGUNCm9uZSBwbGFjZSBp
biB0aGUgZnVuY3Rpb24gdGhhdCB3cml0ZXMgdGhlIGNhY2hlLg0KVGhpcyBlbWFpbCBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudCBhbmQgY29udGFpbiBwcm9wcmlldGFyeSBhbmQvb3IgY29uZmlkZW50aWFsIGlu
Zm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByaXZpbGVnZWQgb3Igb3RoZXJ3aXNlIHByb3RlY3RlZCBm
cm9tIGRpc2Nsb3N1cmUuIEFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGRpc2Nsb3N1cmUs
IGNvcHlpbmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoZSBpbmZvcm1hdGlvbiBpbmNsdWRlZCBpbiB0
aGlzIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50IGlzIHByb2hpYml0ZWQgYW5kIG1heSBiZSB1
bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29u
dGFjdCB0aGUgc2VuZGVyIGJ5IHJlcGx5IGVtYWlsIGFuZCBwZXJtYW5lbnRseSBkZWxldGUgYW5k
IGRlc3Ryb3kgdGhlIG9yaWdpbmFsIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cywgYW5kIGFu
eSBwcmludG91dHMgb3IgY29waWVzIG9mIHRoZSBtZXNzYWdlIGFuZCBhdHRhY2htZW50cyB0byB0
aGUgb3JpZ2luYWwgbWVzc2FnZS4gVGhhbmsgeW91Lg0K
