Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA883DBD4F;
	Wed, 20 May 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278768; cv=fail; b=uypmjVB5vscq97MqEARSjTaOdwqjqAIrk3Z99OYH8QJW8WHtN2iCHoOGqwerY9Bn5B173CGk2P2WajYqgVbhDH1EnSyUyq+wv7AKAkPQWFZs09KDFKf2PQGwBieNv4pDNC82G46XvlyaGFisPn3AR4WybQlDOc/NUKAXg2lHPzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278768; c=relaxed/simple;
	bh=EAaijzYLj++JQ4wAMlb1eV4BVHyWwdtNDajy11yIJEM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=msKbJFRIP8IXyArfdH3o6ItL619hJ3Ohd+65SqG0O4zFVadRl1hqGN6WCxqEBxIPCJ6sE/pzoHdYSgcIrme6UcPQDgFp7WjOvJ9Dse2cnJxD9IqkoDwEWdY/acXXD3+vK11o8gLs6qS9JZU7OAHKFDzgYZUy19gJz2meI56A2Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=aguasiH6; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="aguasiH6"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBDiBf1703731;
	Wed, 20 May 2026 08:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8RhrD
	vqDS4y9mTjiDFmzieadrrFcUnk/gI5I0HtM3nc=; b=aguasiH6ltcUCW7C9ZAuO
	enYJHpd66QrMYBC7C37DY2ZcLiSbW0irTE06K8ZThEDM329Bn4VlO22kvAFVc/t+
	UvmYOEO02eObQMQuTTFfuQTrSSpAWAINnXZ2I3LcTQuwNuC0nn8hsisEIyrteUzf
	D4ZMIysMLXo8t/RGoef0VOM72kypnok9UYsuH6igfWZ4gECsHgLHheP7lPX/nZja
	4ie2wrQnQWbIYS9CH119G9qXpLTBA+hQYIKKqNJyjZf2S1dxXFcLc4dMX3+Kdol7
	AEmtYOzaxoNxA+/SbrTw2lyttht8LgITepURh09YCB1deimRoEA55UDCLAI8wSxh
	Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4e970199ah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 08:05:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRYKkGFWoI+fuqcPX3vnBNugYytkg7xWizpFe7yeSmK1a10MDE+Wf+Om2wGoOmDpaAvrilRClE7hBXGBiXJWKEzmWz7ALbdBbW1eT8CFHup24othWVhfN7enQ50mOjaMhbdFbKO3OwKw0wUITcTVzZbsVM24HqzuabJ6c7y8iU6hMnmJm7ebSG9LDq/IN2t4bwiT5TaLmbN6VWeU8NjEoF9Ir54o2rYK4hAfWEeZMC6OmarWUjR/npztr/fiu5afUIktnpdjvFtb3uVdefDLML8hKaOMg+4CcVySZfuCBC4obPx43HzMlAidoAIekBdfc4ww12whCYC2il/ryPIe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RhrDvqDS4y9mTjiDFmzieadrrFcUnk/gI5I0HtM3nc=;
 b=TrskiNzOML7UXlls/IOt8FYxxF/rxdWR2I3wApEBObNqR/19wItccVuCz37sINbLKwLQpwLHuGvA5ED8Teiyeg+/Cv88cLhu3KNJfp3JEBKstQ+aqXjyr/lWvfj2X7sShIRaIkEHaVCRuiVDBbyeYdx+SzpYjuWtwfEyYu1woCdYSgs8+VQcVltFbwFwHZGgzcyjCONj2HQojjjMDIhqNSI5KyFNq9Vd1rbRIVBnFl4ovQQV5O1ziZpliJF2QIcCjM6SVBGerricrPzuCmL1Dke3HCMzt5MLUCZv0UpTBBANOU8leBAVBZP9SZqUMTmmf+zNyZ2yoXLJGdAYokvECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DS0PR03MB7228.namprd03.prod.outlook.com (2603:10b6:8:126::15)
 by DS6PR03MB989092.namprd03.prod.outlook.com (2603:10b6:8:368::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 12:05:55 +0000
Received: from DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5]) by DS0PR03MB7228.namprd03.prod.outlook.com
 ([fe80::f873:a933:7837:67f5%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 12:05:55 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Conor Dooley <conor@kernel.org>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH v8 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Topic: [PATCH v8 1/2] dt-bindings: leds: Add LTC3220 18 channel LED
 Driver
Thread-Index: AQHc5yzjGCMc9oMQVkaWY4GI0s8sTrYUjb0AgAEQpoCAATSjMA==
Date: Wed, 20 May 2026 12:05:55 +0000
Message-ID:
 <DS0PR03MB72289EEAD92718247E10BF6EED012@DS0PR03MB7228.namprd03.prod.outlook.com>
References: <20260519-ltc3220-driver-v8-1-e1771c1733f7@analog.com>
 <20260519012307.5FDF6C2BCB7@smtp.kernel.org>
 <20260519-dynamic-wanted-fddec7378bfa@spud>
In-Reply-To: <20260519-dynamic-wanted-fddec7378bfa@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR03MB7228:EE_|DS6PR03MB989092:EE_
x-ms-office365-filtering-correlation-id: 507e334b-7589-4a69-ef82-08deb668254e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700021|11063799006|5023799004|22082099003|18002099003|56012099003|4143699003|3023799007;
x-microsoft-antispam-message-info:
 f3bOBLQyswmuDlHbCKKvdiRkSh8ZHBLmU/HFI1Iw02iUHMZO4w8hc7zr4j0frksblwr7GvcSW3Cihr7Y+zCouHhXrIYYMMH77+yw7lil0zwHQc0P06C/RxFjsTJpJG0BkXFagl6c3Ig6Q9z+WlrWpLkP2etTSm8yzG1kbEMtfDl/CaO3Jm3/mqNY0c3xJOZvHLaFzI9Cnu6BO8TVlZUp4gfNwh0GBo/mNlVSEOvQdFsXfyC0CqzGkCOIp0vZ1mUWzPXyQvRB1Q0DZ4OwYRw0DI4cSFRSq5P+x1Hspt5BPtgrciJ4nHj3cjUkGA48G77YB7srPoF3rFZwVhnqyk05gkW82gQN2IDEZl54Ik+yzWCdSDXPbY4fS2V4C4mYXFgH5G4LOKfM6sjjmUiSDxdkhxPPagqW5mIyi+1fZ1Ujo5SRcyneyZFoVw1vyvFgkFkHyluD2NhQDTVFOdxSN41CyzQ5hEvcDCfWDhQRI72ME0y9IWr/A0ig84CjbuW54tbOiYBSob+a1260XchON5VGYWP0/mGNCqSTDwWLJ5AWf+TTsd5B7ZyK95tihPKffIXfrftRrSlhqUeaPwKtrvaTjb7AKsVWVZAtjdWx7rg+gvWqmeCjKze8yDXRlpIx2k310XWa4bFUeVNH/5YPUb12poSzH4dHthpzjBzFLDzAnAi1nheZDx+/9O2yAxM49mq4fVu6l83IKpYdUR8OBrYnsXtyAEFOXau55c+Gwti4+jeLHbBzZtLlUa8pwmk76sHq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB7228.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021)(11063799006)(5023799004)(22082099003)(18002099003)(56012099003)(4143699003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ddN2xXo9G23Um/TgIMT8SxPyWVcs1Xs6oe6zpvo0IgbR+XHaamtQSULemZg+?=
 =?us-ascii?Q?XXlFBcNZNR07y7DAXsA11wA14ZZAlr5dKizM8dpyzvVD4cvKnQiP1qrPVGcd?=
 =?us-ascii?Q?Jvs6Mherthc+CLLy+NZogWLfhI7Vj2BEFDHn0hvmazFfccNYIOl0jD0Q6iIB?=
 =?us-ascii?Q?AVr9GSAZG3Q5ENPNCS4ZEpqab06Nf/nsMXe1KYtdbuzbg0hIEQ++Y1YvDESt?=
 =?us-ascii?Q?+xc2c89OH2/ldMMet9Zk0wfscupDc2MKPg63ciDtobGIiPwgzjA0IbQ6Zw8f?=
 =?us-ascii?Q?WmxONDhXXsNlQaRaANONpgN2OeD2vJmw0A/hzSc8teSTexKc1mKWeoovZ/tf?=
 =?us-ascii?Q?IfZ2C0bI9yW0c/qBFRzXOyUw8mQp9cMLnX90hSY4jqVYf6Q7yt7wXAPjFLB1?=
 =?us-ascii?Q?lXXhFm4woDvYsh3xQm010p8Kb9AAqMdk3+ahaRiFHGfmlOotW0w8c1tAYUjj?=
 =?us-ascii?Q?RWy9i9B5mao4sS2k3lFZDFN7SC1cB1dZbyXr8kyx0TawRfXvdrl6Ktt4D3rQ?=
 =?us-ascii?Q?9zybUUO8tfqxX1GM1ctLrgkiMk/bKgKkJcX2UeiVz+afksxtqq1dQF+jYiHP?=
 =?us-ascii?Q?K1puDeQ0cd6TUpgwZs9Nm71WRXHSWrspqyRgoLCIa24jIIXrlCE7OlPuLXYb?=
 =?us-ascii?Q?6M0n+uztzlta0vjkqvBXXTlVkqpI6aJ1h2kyEskC49wxtZQiuhMuzKqw0PrP?=
 =?us-ascii?Q?9oGAZjkzQLPbwndOPW+wI/2HWhdL39NZ38kvV/O9rm8Uj1Z/uMfnoi8/hFH9?=
 =?us-ascii?Q?p3xeuAJ3T388lly53uZIoU52/qe16NiylzFscLo38UMMRk+1jmNEBwW/C2oY?=
 =?us-ascii?Q?HorJc1WkkOk5Qo3Pd0CcVslYZoJaFYfzbkOcW6OOfP3h33eVLUH+rMh3Is2z?=
 =?us-ascii?Q?AZ7c+ivwbBxESlDNp6idHgYKbQqWBdMkHrOQDKE8oRIcGEqTd958vXLV6TPK?=
 =?us-ascii?Q?E0p1SIud2K5dZXJidqjbF2ckAEXylvDYkUmw6XMthfQCwxrK3ihG/mioLg0u?=
 =?us-ascii?Q?4qVcXUnjdlg6eqnwO/0Hn1jlqL/nkAZrJEihgVM6oLfC7QMOREe7sOUJoioy?=
 =?us-ascii?Q?G8ZaJUc0erdRimKlkUsl58J6X02T8xF8S6lUAA3QKyJeBR5Lt97J4feKBPDz?=
 =?us-ascii?Q?WiGkZFUEOjep4bRloN3ljoZ+8WGnr9ALw1ubGlQjSMXHv2VXvg+WACc0Lxdv?=
 =?us-ascii?Q?DZhqTZOBY0BIA3VZbFjlA8hVGGGV8ElufOQ0HBvDOFRaiYy69bZcuMNnQs6Y?=
 =?us-ascii?Q?Pqqni3Nodcgr7SzbRjq1PxBD4RPuZEMdB5lwbaNbA8YTatoy5TXETNPNuOou?=
 =?us-ascii?Q?YUviG79gjhQDgke0wMKh9/7TU1CDSL+32uPPFZh8FDdmEtKLmGcOwlsP8c2G?=
 =?us-ascii?Q?uDKJfG4vRIbJTFClcp3wYOKRx4DvRHphMQbKA047pvKen6kjpYFLJNwq33nd?=
 =?us-ascii?Q?riwcyhS31aXkMXu/W/cH67HjSlgz3s3oyfGGVBxT+IHyI9eGqylN4ehpAVsx?=
 =?us-ascii?Q?rKbuPMxv5rfStddGt2hwvMdI5dtvuKaQOfGDZ8K+sGrCEYiPDgNTfKUhWLDT?=
 =?us-ascii?Q?2C2YE0DxAv+xET+7pqEMLG4FUNwHys9uke5YxYuqaduTNf4TWkxbSge5SRsE?=
 =?us-ascii?Q?IRg3ELu/Nob82xmfrDVvBcizkD03cgwQqDo9UXJIeF3ln9W3F+0GXbY+Fmjl?=
 =?us-ascii?Q?3e2T6BIHPi6I+Wv3gxH/e7wIwA9N7wSjzT1JzaMzetXndum0qNXVzM31WFhp?=
 =?us-ascii?Q?TO6Ifz/1rD3kJvf0OOYMGLoWCfOzSp4007LO2uWkqOFQKsWxIAEK2JL23sH2?=
x-ms-exchange-antispam-messagedata-1: jRrbTYhMiRSWgA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Bql9mEHaSoBLqTE/916ORJZmzAExKVR172AgKTM6zELnEo9MtLvvGocU8Ckgu+XFTkVuqczbP8gfBYGx5WA/sK94xSQvNH6tIBCXo2BA8UoSnbJ4d/4+Tz5X3GdVkIE/oRykAv1Tp94HZ4YKd2DLCUkollBq8Y0LyZD0O8FRAuypbX1H184SNXLUgaYWbK9Qn5OrVYMDid4E3lSjJ+QpKq5+OIca6P1AWhu5+N6Odz9RAsfgfx7KudDo80VZ0o0ZsK3P9noG9va183wEOJ2VvLiZLpXNmRm0VZGORRwHfzOTv1QYg5OpwvGaPoQA1Y30s+t/Uzz5H9bX3/btQU0xyw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB7228.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e334b-7589-4a69-ef82-08deb668254e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 12:05:55.1942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwMHg5SUKOZ63fyt8byA0AeTkbtyGq0k3y+D4F5o9WkZqlqptObZizBdb+3lG6JB3phsS5dGmMIF2uZGbYOnWB2MaxSSitqn3BwTkpfV720=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExNyBTYWx0ZWRfXyN4fc3JzLFNE
 uBMypf1oW/LhuIeOj5l9X7V4S4mw/IR0PfD9Y8AnSqOWmRAKYFIJ8U93ZV2mn83oEk38UUG3GeV
 E5rl1APW08X4KA1PZAoVO+sR2frV8w5XwPZO9f4HDdwsBLrCCe95PdwHZW6BKlFRdqpgESoamxi
 Rjif9D7ZCSZ+UdMw8d7H0i6qudC1tROPXJ2jcj5hup03Z35iHpGJmPxFOQWnvF7Kjbtzk1LUNeX
 /YVV4DI4AZILNdp3YxCb30Jjp0hSY1l4DPG/71rdVOP+0nT2mdbbIP3aATYK528NYUVZqp1Kj53
 j0qBCb+csrLIzpnugR3cuJCbgp7O0/rViFGYBwKyWf4m0PokvV5DyUPX6QadWONUo6R74Up/V8P
 WxQH7aqMrZNFkc7enPyQnWCBsihI2GVFFhnJigirPjzDEL0bp6Iqnhd9oE9XgPZ+Cm0gUTM3hH6
 FSxO7qmX3/d8B2TeZkQ==
X-Authority-Analysis: v=2.4 cv=CsaPtH4D c=1 sm=1 tr=0 ts=6a0da3a5 cx=c_pps
 a=VQ1tsm+IcWX+DCGDUvrerQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=nxoUk7l5Bnnnw-9vSn0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: wvB6gWlE0BzD8EcMXYsn2VIhvgUMcLqI
X-Proofpoint-GUID: wvB6gWlE0BzD8EcMXYsn2VIhvgUMcLqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200117

Hi Conor,

> On Tue, May 19, 2026 at 01:23:06AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to
> consider:
> > - [Low] `#address-cells` and `#size-cells` are omitted from the top-lev=
el
> `required` list.
> > - [Low] The schema fails to programmatically enforce the constraint tha=
t `reg`
> must be 1 when `led-sources` is used.
> > --
> >
> > commit 7595dbcc690fee63863037049c154e7a47df9973
> > Author: Edelweise Escala <edelweise.escala@analog.com>
> >
> > dt-bindings: leds: Add LTC3220 18 channel LED Driver
> >
> > This commit introduces the device tree binding for the Analog Devices
> > LTC3220, a multi-display LED driver with an I2C interface. It defines
> > properties for both individual and aggregated LED control.
> >
> > > diff --git a/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> > > b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> > > new file mode 100644
> > > index 0000000000000..9e545442f3d9d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/leds/adi,ltc3220.yaml
> > [ ... ]
> > > patternProperties:
> > >   '^led@([1-9a-f]|1[0-2])$':
> > >     type: object
> > >     $ref: /schemas/leds/common.yaml#
> > >     unevaluatedProperties: false
> > >     properties:
> > >       reg:
> > >         description:
> > >           Output channel for the LED (1-18 maps to LED outputs D1-D18=
).
> > >           Unit-address must be in hexadecimal (1-12 hex =3D 1-18 deci=
mal).
> > >           For aggregated LED control, define only one LED node with r=
eg =3D <1>
> > >           and use led-sources to list all controlled outputs. Only re=
g 1 should
> > >           be present when using led-sources.
> > >         minimum: 1
> > >         maximum: 18
> > >
> > >     required:
> > >       - reg
> >
> > The description notes that only reg =3D <1> should be present when usin=
g
> > led-sources, but the schema doesn't appear to programmatically enforce =
this.
> >
> > Would it make sense to add an if/then block or dependencies rule to
> > enforce that reg must be 1 when led-sources is present, so that
> > invalid configurations do not silently pass schema validation?
>=20
> I actually dunno what the syntax is for restricting this from the parent =
node, but it
> could be done in the led node I guess, using something like
> if:
>   required:
>     - led-sources
> then:
>   properties:
>     reg:
>       maximum: 1
>=20
> Probably.

Thank you for the recommendation I will be applying

> >
> > [ ... ]
> > > required:
> > >   - compatible
> > >   - reg
> >
> > Since the schema defines child nodes with reg properties, does the
> > top-level node need to include #address-cells and #size-cells in this r=
equired
> list?
> >
> > While dtc might issue warnings for missing cell properties, omitting
> > them from the schema's required list might leave the DT schema
> > validation incomplete for the container node.
>=20
> I think this second one is something you should implement.
I'll Implement this.

Thank You!

Best Regards,
Edelweise Escala
