Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DB2E62B7
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766625; cv=fail; b=oteGaZs5JHfnXDDPz1aTJ1NwdeewvK59IIQQ5HGDMskLBGFn2OPfqrs3BmfMwZw+aB+SjeSLhcaCj1J9YtpgJCmwZDeDSs0g2GWWnvMyhIjUxGMqy7mIx3gEjOMcETs8fI4PkEPUu/T+Jmnw38iLyLhWQMHLGRWyLh2aGppQELg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766625; c=relaxed/simple;
	bh=rASWGdv/3HqGK2fbVBtHH82EMFufV43qq2kOumOWaX4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f6T3oDWhGa6Q2DX8Q6+Z48VDOUL6qJQ5or3r6D8Xf8TrrZS6fRwDcnMb6SXSxPFjdcPXNKCzf1p/xNZRtwBdywWJcEHk7+Ef/nDlr37BEBHZJOcUO3yqx/xv2FgqkO+nDYqPlxsiNvHp3jMivET5Z9CHIxtemU9HC2nVRrdiai4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZOGRqQaB; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZOGRqQaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHsUaD11KQBYAQolxPdfyppdzFWlrG3wkgAyuMqS+W4rrxf5sG5EObqluvsCaQKB6MeufZgJ3o+ZbwiLJhQycmFLpp7FWfXU3lTdLhrtoqlM4FHN/Za/jp5MSajlW5X9Jjjb8tKN4j5GG9OamwsnvNV6pcvmHEk6e+SemShhspPEHV30kRZY8xE4lSGfgF3lO4sAIjcA6Z9eOtBvgu6aDJn19vSj+mB3tjkZrneYLmOuIc6YUGC/AT18+6mvAMRQL9pm9Jj2D8ghnv04BocJksAJ48vFU07XVE9OUbSQG0+omIg3+gJgprI2M9pR9ZJypbv80TWRuXVk+Su6b5jMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rASWGdv/3HqGK2fbVBtHH82EMFufV43qq2kOumOWaX4=;
 b=IxIs4+QfcnpL20kNPivPX6K3MEXtMd8xNZDIaomaG7zp5SAUMPcQm4IVX4xfXlp6CT3xL5xyhxfCZ7YD6uOzoBBpDRyvW8nbCiWUG+a2YoU6KuOzxs1CrYMQEsaB0rW4wrjRiOYtKcer025iO4xKQ+WLN23xwM4Blfclx4N5vGRTL5MNMqeQdLbMQbv+btyRzBniRFsIN1y8khs/cefEXC5cG7c4C2Ega1ZWsXZzMIkHYkV/nzPPFzTzXWiJLxyT+CL/TDH79sS2GSmU4hfs5O0K5Jhg3pV8Clxk/rRkFb1uXpzuUoLTicYv+xWjyPqhrp2qPhFTX05itMf2uei5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rASWGdv/3HqGK2fbVBtHH82EMFufV43qq2kOumOWaX4=;
 b=ZOGRqQaBZ5pnhdjoOaoh5+l2j43G5VdCcJ7XnL1bV4CEjFGDIB4GYbU6NeP3QS7QD2lo/3NVUKMVXfy6yep0rYtYsu0U5PpkfZ/6MahqcEK5wvRu3W8H5Y6haDweeCFgU4Fxjrf0fyugUasMXYBLzyUxa9qPN5+d2ApEsJTCXzlqRFXfJNyYVLf1Xd2Igm9HxoVoY290+J1olgDm2N6LEgQSHhHfQrdX4c+doRgnW7jBsXYzp5Yd/PrHxMjYN1hHHz6OF3HImJ6Q2o4wCcNlZA8L73F+S7o2Gwl+9dsONNp4OacE1+l/I+8omx6R4GcBkl5zUZ94CnoEohWm2LKZUw==
Received: from BY5PR11MB3990.namprd11.prod.outlook.com (2603:10b6:a03:18d::31)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 14:16:59 +0000
Received: from BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3]) by BY5PR11MB3990.namprd11.prod.outlook.com
 ([fe80::2349:6631:bb47:77d3%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 14:16:58 +0000
From: <JensEmil.SchulzOstergaard@microchip.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH net-next v10 1/9] net: dsa: add tag driver for LAN9645X
Thread-Topic: [PATCH net-next v10 1/9] net: dsa: add tag driver for LAN9645X
Thread-Index: AQHdEtU5QvKz6EKfukGXNyPBpP+ex7ZtGKwAgB9nJYA=
Date: Mon, 3 Aug 2026 14:16:58 +0000
Message-ID: <b3636750a818ae6f4097da69bc0337d923f082d4.camel@microchip.com>
References:
 <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
	 <20260713-dsa_lan9645x_switch_driver_base-v10-1-a4886a08fb15@microchip.com>
	 <20260714144344.B5FCD1F000E9@smtp.kernel.org>
In-Reply-To: <20260714144344.B5FCD1F000E9@smtp.kernel.org>
Accept-Language: en-DK, da-DK, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3990:EE_|SJ2PR11MB8566:EE_
x-ms-office365-filtering-correlation-id: 8b8dbc04-6633-44c1-23f3-08def169e15f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ywVCAEmRz7xydrVI+wRKX7y6GB+NAwV1s6jZ48j3VFQyHYeR2TsptEE+DzPFOQFItaaCBE8lGhThqvKB7LsYUaqqpHP5RCIQx12+uQWWUnOhcQKpTaIW8WrDrziRmVq6Aa5X9I8xyDXOLIVnXr4KN89xAG5H5PMr0b1Pp6aLjdpUIEvHQmAqQwoIjUuRUckEoLm0QR7W4eB69nri1yowFH6Z4TnBNMghiF3a4MlZQpv6lyBMYv6QyKDzqTFcQe+Fy0SivmoyRI1iMIZ0EBEtxjkACrG5MZAggLnZK3HHqy3rKzXdGqFJLZZLINvA4KUwGpav97Ojyl+zsujJ76KSE3UaIqMtBbxw7MRqdlLPHWY6zw1o1cLDuZ5nvivNxmq6sjfRQ26IPME6wBpnZoylKdHK1N5MSDgAonH/0tMuczXAPXMCueih0EE9LyfaYqvr+u0rSOIv23/FgF9POn9q1fTv+A5Aaaqkh892Sa8deTHlNo2AU26DzD0U/tgNqnVtj0+8dtemVM+b5i5VkeESd11b4TWZnUCD2iO59hYv792lDqRqi0e6iBreZkwIkmglesRmWa2jNIFv34wnUzfswPsUrQgM1eSqOpX/q/8R4TdIFiQtJdgvdL/AwaazVvTRxbhktb98O+33mDk40758GEUlb20dxUAuROiINFUxjdQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3990.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dFJLcXNlQlNLb1p0bnpBQnRTN3FRQXVBTkxPN21XdG1nMXhVTVE4bGs4TTZy?=
 =?utf-8?B?YVRESzd1OVFXS2VuOHVOTmcyN052S0FNNGFZS0pJc1o3aFJEa0w4WC9QSHZV?=
 =?utf-8?B?dmpWMnJkVHJ4b0FvdzBRL0tzQnVlRGRvU1I0MGxPNjRtWGs3R2l3a25JaTF0?=
 =?utf-8?B?T3N3WS80TW1RZ3JyRGI0QVMzZ0lUVnh5V00rV0ptektTUkVZcHUyTHdaZTg2?=
 =?utf-8?B?WGpZa2JPeWtIbUdzdUhlb1Y5ZEpIVjByR1JHMk5vSlJ0NGlCQ282SDVnczV0?=
 =?utf-8?B?QmlaVFd4ODFLLzJNQXVHR0VVaXpOM3VKcEV2c1MydzMzYWRDWUZ4TXQ3cWF3?=
 =?utf-8?B?WFlUNW9UbXB1OEtmRDNZTUF2TEtCZkV6RVE1UTJtVWVKVzFOS0N3c2h5RjAz?=
 =?utf-8?B?Wk5tYm1ueVpYZlgyRFlpN3Q2cC9Ob0xrSHpydFo2OW9Fd3JTSHoyUnBmWXFQ?=
 =?utf-8?B?d3VoWVBLU2toR0M2SkNYa0RtVjV2NzRtVUpwYTd1aSt2Um5IK2ZqMnVmQ2ZX?=
 =?utf-8?B?OXlJN3BUcE1zZXhlWU9IdE1HMmp2VnpoVEIxUGx5SXpxMExqTUNvUUpXK3Z6?=
 =?utf-8?B?cWUrSWRFbXMxUEpMMzlvdHd0Q1ZHanVRNmdxYXdMTWVMNnR3dE03c1dod3lI?=
 =?utf-8?B?K3VvcWRSWW1xS2ZtcmM0aUUwbElCbzRrZHJUdldhOFdCMlR1TXBxVmdHcGJu?=
 =?utf-8?B?bzF1azNiUGxEUVN1Ylk5N2c0VFNUOStaZGp5SC9YMjRRUzhnbGJuRi9FOGRU?=
 =?utf-8?B?cmlrNFh0bWdMc0ljUm50RWpxa091MUxQM1g2SE1lVDRIMGhSS2NBK3krdVF0?=
 =?utf-8?B?Z2F5STRpSUoybG9iOG9Ga2RRbG10bEE4UDc0WlRIYUJ1QUVZZ1FZWFNzNTAv?=
 =?utf-8?B?NTc0TW9kdEdwOGR4MW9lb0tkS2tYYTV6dVd4dW51bnNUU05zKzFLNVJDdVFk?=
 =?utf-8?B?T1JnbEV1ZUFSWnk5Skgyb0lZQlNxbjNhRHZwM256YlM4RnJsVk5NK1JBblF6?=
 =?utf-8?B?ZkZTZTYwM3BlSFA3UngxRmRUcDRxSkU4VWFBU0gyaTZ5NVN5a2FTTXdZTmRW?=
 =?utf-8?B?TlhlemhFc0MxZ3ZVY2xmcUl4M25tS0VURW5oUkpaS0l1TkVuWXBCZnNlbVpi?=
 =?utf-8?B?bmU3bDB3ZS94Z3llY3V6Z1ppakxCNkpWVURlWExoaStWTTBVdEFjTEljMlk2?=
 =?utf-8?B?OUJnRE9hajZVWjJzMG81cktsR2Z1ZGllWlJSbFQxc2ZPUjZRS1JmN2RHejR2?=
 =?utf-8?B?MmN3OEVXWGZRZVRBSHZpMjEzZmt3LzdCeHNDSzJKKzNsaXlnM0ptMmpuMFR6?=
 =?utf-8?B?c1hjNmhIalNxWUZLVGwwb1ZvYjBhOWRkQ01WeXEyc01UQVVESjd1VTZQM05L?=
 =?utf-8?B?a0s4U3N6TDUwNy90VEx1K0M2WmJsZk4zZklEZXFvREhabE9CODlmNjRPbUxM?=
 =?utf-8?B?VHVOc0RQakJLTGFxS2NmTDN3UlNBVWxFQ24rUXFiaSs1RC9tK0pFWGxieHVI?=
 =?utf-8?B?bWtoTHpuTWg4LzhPTm5zTHpRRjVUQkRydUZ3UU1TQ25CYjJLOTY3d2FWZFpm?=
 =?utf-8?B?VXNkWUdCY244a3Q1enQza1YrazNNZDNETkhSREs5OVRSTFd5Y05ueHVicE9Z?=
 =?utf-8?B?NnVudVJBNERNenVNeGNoam50NVdlKzlKMU5DUk1ZVFk3VjhoaklHckZIRmZU?=
 =?utf-8?B?WE1SU1B2YXdOejFGVUg3dHNKaUJEVGw0dXZmekVjT2dZa2hBZ1BYbFREdUpW?=
 =?utf-8?B?RlJ3RWRKanNVN2VNNlFrZXJRK0VFRzA1eUdKLzFBNERRVUFkdmpCakJQSUhn?=
 =?utf-8?B?YzRsOFRkWVJraUwzNG9HUmNJckR1a1dlWGttMFMwZHQ0cGVuTlg5Q2xEd0ds?=
 =?utf-8?B?QjFiU2RTYXdqMFQ3REF6NEhaTlcwdTVpSUlNcHFkenY1L2tXL2JJYWlmeHZ6?=
 =?utf-8?B?YVdHQjVPZjVmazgrSW0xZzczSklXS0ExMHEvRHJnR3BjekNQNlhEbFFRS0Vr?=
 =?utf-8?B?ZXpUK0tJQnBrb0hnaUg4SUJzaGhFdk9GU3BXVE5FcEFWZFdvd3l0OGRkVFRX?=
 =?utf-8?B?K09pUk9SZGZyRmtraFBycTkyTW5sYXR1S1pHNGdCVzFUT0VhMDlZMGNUZS9F?=
 =?utf-8?B?UndodEp6ejVUMFFVaDJ4OFIvVW9QK0N0Zkp4MW1hYjlTVk1KdTRHb2VOaXhw?=
 =?utf-8?B?blFQZE5oOEtTNUtteENIMDk2dG81WlIzd0pwRXdhb2pUaWNQakZEQlNGL2py?=
 =?utf-8?B?NXJtWVNnZjFrVXgwT01ZbkJTTVhCQ0ZBT3ZJUVdQbXJLYnZhbFJGMmR0RE03?=
 =?utf-8?B?SkUzZU44c0d0Q3FERzlrQk1YWkcxWUl5RjUvWW1YRGRqU0U4WkkranpOZ2lI?=
 =?utf-8?Q?Zr9q0KAvyUG/jFH+vUrHtCRA5FQsgL0v459La1dAM0fhU?=
x-ms-exchange-antispam-messagedata-1: UevGibAiaTad8g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <543E58A9CE688845B6D4AD7442D8192E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8dbc04-6633-44c1-23f3-08def169e15f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 14:16:58.7561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wa6gWDUNUTmRS5k8CB982FwQ+X/ETgJPJMmYgFSd6zyePxLj6NZ0KsQdEwpoXJnJJf42WexrV4x7GH0NJUtV65dh8N3ipq75VfQ/npShsy5C3sKtY+CEMwkh27p11AHA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566

T24gVHVlLCAyMDI2LTA3LTE0IGF0IDE0OjQzICswMDAwLCBzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90
ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBBZGRpbmcgYW4gb3V0LW9m
LWJhbmQgVkxBTiB0YWcgd2l0aG91dCBjaGVja2luZyBmb3IgYW5kIHBvcHBpbmcgYW4gZXhpc3Rp
bmcgcGF5bG9hZCB0YWcgcmVzdWx0cyBpbiBkb3VibGUtdGFnZ2VkIGZyYW1lcy4NCj4gLS0NCj4g
DQo+IC0tLSBQYXRjaCBbMV06IFtQQVRDSCBuZXQtbmV4dCB2MTAgMS85XSBuZXQ6IGRzYTogYWRk
IHRhZyBkcml2ZXIgZm9yIExBTjk2NDVYIC0tLQ0KPiBjb21taXQgM2ZjYTNiMDllOTVhM2VlZWUy
NDdjODlmOGVjZGY2MDIwNzRlOTUwNg0KPiBBdXRob3I6IEplbnMgRW1pbCBTY2h1bHogw5hzdGVy
Z2FhcmQgPGplbnNlbWlsLnNjaHVsem9zdGVyZ2FhcmRAbWljcm9jaGlwLmNvbT4NCj4gDQo+IG5l
dDogZHNhOiBhZGQgdGFnIGRyaXZlciBmb3IgTEFOOTY0NVgNCj4gDQo+IFRoaXMgY29tbWl0IGFk
ZHMgYSBEU0EgdGFnIGRyaXZlciBmb3IgdGhlIExBTjk2NDV4IGZhbWlseSBvZiBzd2l0Y2hlcy4g
SXQNCj4gY29uZmlndXJlcyBhbiBOUEkgcG9ydCB0byB1c2UgYSAxNi1ieXRlIGxvbmcgcHJlZml4
IG9uIGV4dHJhY3Rpb24gYW5kIG5vDQo+IHByZWZpeCBvbiBpbmplY3Rpb24sIHByZXBlbmRpbmcg
YW4gaW50ZXJuYWwgZnJhbWUgaGVhZGVyIChJRkgpIHRvIHRyYW5zbWl0DQo+IGNyaXRpY2FsIGRh
dGEuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9uZXQvZHNhL3RhZ19sYW45NjQ1eC5jIGIvbmV0L2Rz
YS90YWdfbGFuOTY0NXguYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwMC4uMjY5MmM3YWQ1NmNiYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9u
ZXQvZHNhL3RhZ19sYW45NjQ1eC5jDQo+IFsgLi4uIF0NCj4gPiArc3RhdGljIHN0cnVjdCBza19i
dWZmICpsYW45NjQ1eF9yY3Yoc3RydWN0IHNrX2J1ZmYgKnNrYiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYpDQo+ID4gK3sNCj4g
WyAuLi4gXQ0KPiA+ICsgICAgIC8qIFdoaWxlIHdlIGhhdmUgUkVXX1BPUlRfTk9fUkVXUklURT0w
IG9uIHRoZSBOUEkgcG9ydCwgd2Ugc3RpbGwgZGlzYWJsZQ0KPiA+ICsgICAgICAqIHBvcnQgVkxB
TiB0YWdnaW5nIHdpdGggUkVXX1RBR19DRkcuIEFueSBjbGFzc2lmaWVkIFZJRCwgZGlmZmVyZW50
DQo+ID4gKyAgICAgICogZnJvbSBhIFZJRCBpbiB0aGUgZnJhbWUsIHdpbGwgbm90IGJlIHdyaXR0
ZW4gdG8gdGhlIGZyYW1lLCBidXQgaXMNCj4gPiArICAgICAgKiBvbmx5IGNvbW11bmljYXRlZCB2
aWEgdGhlIElGSC4gU28gZm9yIFZMQU4tYXdhcmUgcG9ydHMgd2UgYWRkIHRoZSBJRkgNCj4gPiAr
ICAgICAgKiB2bGFuIHRvIHRoZSBza2IuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgZHAgPSBk
c2FfdXNlcl90b19wb3J0KHNrYi0+ZGV2KTsNCj4gPiArICAgICB2bGFuX3RwaWQgPSB0YWdfdHlw
ZSA/IEVUSF9QXzgwMjFBRCA6IEVUSF9QXzgwMjFROw0KPiA+ICsNCj4gPiArICAgICBpZiAoZHNh
X3BvcnRfaXNfdmxhbl9maWx0ZXJpbmcoZHApICYmIHZsYW5fdGNpKSB7DQo+ID4gKyAgICAgICAg
ICAgICB1MTYgcG9ydF9wdmlkID0gMDsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBicl92bGFu
X2dldF9wdmlkX3JjdShza2ItPmRldiwgJnBvcnRfcHZpZCk7DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgaWYgKCh2bGFuX3RjaSAmIFZMQU5fVklEX01BU0spICE9IHBvcnRfcHZpZCkNCj4gDQo+
IFtTZXZlcml0eTogSGlnaF0NCj4gRG9lcyB0aGlzIGNvZGUgcmVzdWx0IGluIGRvdWJsZS10YWdn
ZWQgZnJhbWVzPw0KPiANCj4gSWYgdGhlIGhhcmR3YXJlIGRlbGl2ZXJzIHRoZSBmcmFtZSB3aXRo
b3V0IHN0cmlwcGluZyB0aGUgaW4tYmFuZCB0YWcgYmVjYXVzZQ0KPiBwb3J0IFZMQU4gcmV3cml0
ZSBpcyBkaXNhYmxlZCwgY2FsbGluZyBfX3ZsYW5faHdhY2NlbF9wdXRfdGFnKCkgaGVyZSBhZGRz
IGFuDQo+IG91dC1vZi1iYW5kIHRhZyB3aGlsZSBsZWF2aW5nIHRoZSBvcmlnaW5hbCBpbi1iYW5k
IHRhZyBpbnRhY3QgaW4gdGhlIHBheWxvYWQuDQo+IFRoaXMgd291bGQgY2F1c2UgdGhlIG5ldHdv
cmsgc3RhY2sgdG8gcHJvY2VzcyBhIHNpbmdsZSA4MDIuMVEgdGFnZ2VkIGZyYW1lDQo+IGZyb20g
dGhlIHdpcmUgYXMgYSBRLWluLVEgZG91YmxlLXRhZ2dlZCBmcmFtZS4NCj4gDQo+IFNob3VsZCBs
YW45NjQ1eF9yY3YoKSBwb3AgdGhlIGV4aXN0aW5nIHBheWxvYWQgdGFnIChmb3IgZXhhbXBsZSwg
dXNpbmcNCj4gX19za2Jfdmxhbl9wb3AoKSkgYmVmb3JlIGFkZGluZyB0aGUgb3V0LW9mLWJhbmQg
dGFnIHRvIGF2b2lkIGR1cGxpY2F0aW5nIGl0Pw0KPiANCg0KVGhpcyBpcyBhIGZhbHNlIHBvc2l0
aXZlLiBPbiBhIHZsYW4gYXdhcmUgcG9ydCwgdGhlIHZsYW4gdGFnIGlzIHBvcHBlZCBhbmQgYWxs
DQp2bGFuIGluZm8gaXMgc3RvcmVkIGluIHRoZSBJRkguIFRoZSB0YWcgd2lsbCBub3QgZWdyZXNz
IGluIHRoZSBmcmFtZSBkYXRhIHVubGVzcw0KdGhlIHJld3JpdGVyIHB1c2hlcyBpdCwgYW5kIHdl
IGRpc2FibGUgdGhpcyB0b3dhcmQgdGhlIGNwdSB2aWEgUkVXX1RBR19DRkcuIA0KDQpUaGVyZSBp
cyBubyBpbi1iYW5kIHZsYW4gdGFnIGluIHRoZSBmcmFtZSBpbiB0aGlzIHNjZW5hcmlvLiBPbmx5
IHRoZSBJRkggY29udGFpbnMNCnRoZSBjbGFzc2lmaWVkIHZsYW4gaW5mbywgc28gd2UgYWRkIGl0
IHRvIHRoZSBza2IuIFVzaW5nIF9fc2tiX3ZsYW5fcG9wIHdvdWxkDQpjb3JydXB0IHRoZSBmcmFt
ZSwgYW5kIHdlIGF2b2lkIGl0IG9uIHB1cnBvc2UuIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQg
dG8gYmUNCm1vcmUgY2xlYXIgYWJvdXQgdGhpcy4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBfX3ZsYW5faHdhY2NlbF9wdXRfdGFnKHNrYiwgaHRvbnModmxhbl90cGlkKSwgdmxhbl90Y2kp
Ow0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHNrYjsNCj4gPiArfQ0KPiAN
Cj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzEzLWRzYV9sYW45NjQ1eF9zd2l0Y2hfZHJpdmVyX2Jhc2UtdjEwLTAtYTQ4ODZh
MDhmYjE1QG1pY3JvY2hpcC5jb20/cGFydD0xDQoNCg==
