Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793965042;
	b=26f+Ux6iLW1z4bc99lefwMO2fwlHkpiXGiiTVtD9Ctf/UBqVUm6Vuuy1ZRtHnHMmlV/7
	 ux3tnYrGmB+8fNXmyzralNwxBhSwaFb91VJghjKdl+C0RxyYYoWJc0TH7cBS6rpaAemtV
	 3sGwnDQw3JNO898bElCUacXANKuiCnRs+LjubmY4115JNzjq+/2POSTCQGa8vn6YapM+o
	 igbSiVihsgodjuQu7gflsXWiBG9a+DQNq0HcJ6ftF11aaUOlvV7W0nBzAZ1erHtJm6xEl
	 4oJRL4Cd1fCqNGUNU6+zQRfrvl+rMfgikqjYlSFzOZx00Q/4vaW8ryP+pD/LDYgRySA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965042;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1MW+iUI4oZj14MrCNyZPRbHlCZwt6oVrBcjsd/wwPhI=;
	b=VyraYj0zwEAdOB6vqS0duTOAzOuEJbpEKUqQR8b3wJYww0KDs5gJP+cxRjMlVF6yPvms
	 9EVsF566CCJKje8L+4GfazrC4Ma4redPpBEdrwGqct2oXrUhzkU/vvS3KXGylBcELQxbh
	 58FIEgi3kfIUNsi71MO0tK8pNS6/Ps38wdG9zw4OEVA7y76k1ObHMTxcfTZbKg3HQrezh
	 KmCWF4jjZwnVyYSzBWBl0mxoPXrNe40ExsK6ERJLou7GEifm6kz5LPC5l/LLGxSJZ3qSD
	 ZQ1oeRpg0rM4BDlem6l6wcsfVsq2MTTVRc5YRhQv5Qdp0JqGlLEGWe/FkDjIbfVSCfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=fOYVfAc3;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=MXlbvMg8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2243606C6F8;
	Fri,  6 Nov 2026 11:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2243606C6F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=fOYVfAc3;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=MXlbvMg8
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AR7Oe264349;
	Fri, 6 Nov 2026 06:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=1MW+iUI4oZj14MrCNyZPRbHlCZwt6oVrBcjsd/wwPhI=; b=fOYVfAc
	3uDwJ02d5jsSvyUn/cJqeOtDyOZHwG+dmAxvx7yYWiLRkPbwf1wlcqhpybsXXrbr
	/X/JwX0F8gei1Zszaq7d4DoprBgNj5b/L59HND8tC7SlbLk+ewl01LakAdLPRrPk
	rxb0pt0cXh2O9nZB0ckB12q7WB7g3gO3aYf9bfingmLeGu/Qsh6mM1hAroN4ZmTk
	33PE/fB4OCpSTckhf1JVhaW/qqx1ImKe+m0LMbCVjsrJSBZouTd0cf73ynxXEDZ+
	kdb31cq3fe60ZDiFDvFlPzuLBn0EtDll0i9LqsXiuYm8ZDcZY1rnGVYWY5S+Bwqk
	a/K+V2U915rgqdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1MW+i
	UI4oZj14MrCNyZPRbHlCZwt6oVrBcjsd/wwPhI=; b=MXlbvMg8Rm5nTGAyQmmER
	hGo0ENIb5fjVCs8Of6VUdFHt0CvutadCePShQUENIY3wJuOLwEtOO5DN0rqGFo6w
	4RIDptFKLfNM8ruFb8VmctgCurMpOlF+kOLmkYtEtgmSrKUdcXfm1qyvohP7z4bN
	jk/E4eixPn8FO0LeW9RrtkQ3Jasy4mcNDzU4UX/9C4ZwFQZUz9JoMAcrMOU7CbOb
	5pyfxuIWzoNegYtcTvbKNyOcPWKFZgFQymHK0IP9Prv2nDBdjFbFqhVKO/7r9ZRw
	v5bklPO+qt9GU85D9qbISsE7vU7fIJh29L7pAwh+tZTzLI52iadJtqIr4y0PRqIP
	A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hs3q03n6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 06:37:19 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2QBJEGaCPDJc8HENbeCo0o8V6RwRZ7Ly1XA1O4vSpwl+Y+/V7tqOAGr4L30CjHmjMSPKA+FTAQequ+3jOsrC03Stqz5j39SV8DEzGm/0/hmmB6MAjLoe3yJCGmedd3V1g2Ii4THo84oaBVYDvlKJtuxFBB6Z982wuJ4Taf3+tDrp+U8KvSwZ0SJos/ZvjYBpjKUoKBmyJ0IqYhw//pK/yCu1wQjcE9+A0mck/EKAi0R/+zWH2e8n5Y7sul2kGH56qaWIN9mHcr+2o+1vfkjHSSSRqs6LMguOPdhW3MI6BW34B31xzqxb/E222pcpDsMc9aeA/wyVKPtp17r0uEDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MW+iUI4oZj14MrCNyZPRbHlCZwt6oVrBcjsd/wwPhI=;
 b=IeBpEXAabbYk1PC0NvJWRRFERrBJBu3UDRNwpuqGLBtKDCKPrgQy+HNmymyMZpi+f1DK6at6h4Tr08cHydU2/uNWot8wBlvZtTu3eTQ6g6r9qPMJDOAy7lzQv0MqDVxXIOw+XUalvyjvBXolnZgAA/VWIR4VhNwdwz2KhckdoTkoW45BgSg4fsEzUZ3LZgmREJDtX7f5C4v/wklOYuKEiBqEtzMy+PsiUQm0WZ/RNEpg8OD2K1OL/vu5t+A5jqW4VBKD9KT9nkZjgBVH/Ksijynu5Z4xY8fkByKaVLKEmQSirfb0Vx0zleW3oUEK4Cxj9sEgbUKn9wOkPaTsJOA83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from IA3PR03MB8453.namprd03.prod.outlook.com (2603:10b6:208:540::16)
 by LV4PPF393250B39.namprd03.prod.outlook.com (2603:10b6:40f:fc02::209) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:37:17 +0000
Received: from IA3PR03MB8453.namprd03.prod.outlook.com
 ([fe80::6e03:3221:b921:9c9]) by IA3PR03MB8453.namprd03.prod.outlook.com
 ([fe80::6e03:3221:b921:9c9%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 11:37:17 +0000
From: "Stolniceanu, Iustin" <Iustin.Stolniceanu@analog.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH net-next 4/5] net: ethernet: adi: adin1110: Add OA TC6
 protocol support for ADIN1110
Thread-Topic: [PATCH net-next 4/5] net: ethernet: adi: adin1110: Add OA TC6
 protocol support for ADIN1110
Thread-Index: AQHda63Wwqm7anKamU2Gwt3hosU3+bceFreAgALYHH4=
Date: Fri, 6 Nov 2026 11:37:17 +0000
Message-ID:
 <IA3PR03MB8453C7CBC6EAD597BD197BC8F2762@IA3PR03MB8453.namprd03.prod.outlook.com>
References: <20261103160918.409701-1-iustin.stolniceanu@analog.com>
 <20261103160918.409701-5-iustin.stolniceanu@analog.com>
 <sashiko-outbox-197578@kernel.org>
In-Reply-To: <sashiko-outbox-197578@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR03MB8453:EE_|LV4PPF393250B39:EE_
x-ms-office365-filtering-correlation-id: 38cd0a60-334b-47b6-9ff8-08df3bfa4fe1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|10067099003|38070700021|11063799006|4143699003|261022075727099003|261009223027099003|261021135927099003|56012099006;
x-microsoft-antispam-message-info:
 EXuujQsARl7Kbh8xk0ffR4LE/IxVHnazbG9jpvwcrVDXzGb/wHIn7JbpyjVN52Puh75FWm1G6uYWW/TsIWNxri9Df9MDm9TxUOmDo8lJxdyvslV1jMKK80Dj5COwRFPetny4H54IX3JVsgwqK7c94f0GUlQ4J+66h7NmRMYq5qyBL77owqWOOl456ghCat7pYOUV6aYgMHu9qhfDn4FFIMqwAIBgHEK3YhqtJ7BRXX+tc0yFEkgh+akPz3gIIOY9xuc1GpHvWKt7RT8hGWH5iOrX+N5joMj1+fTx1AWwp5aRWbnXWYBCzLzuE4p1rjJsvTli3IO/3yGmBe5aa3z635qDWxaUMblPTFI3G3Paz/QEZ6rPV//oiIPKdeZod5rdDazfB6W146BW8sXMllpF72hD0UDy54zFujTmZOy79wcJ7KR82c5FOTmiqiyiDNrpKIO8iIY7HxmrD0SaMQZ+LF1ZWmgiWIl4BiVqmas8hDrABpL5mIJmoTyA9vZFkEIbDMgN1EQY+3fMxkodTGiUc2jGQ4wJ5b2el6wOQwfTXdbyATSOujlsU9weLycfOxV2Sl8gzKMoeN4PGhO3phD4Hjkq5/Yb7C6K8rzFw+Imzz+V6dua7iy6RBMA8pZzur/CUI5YMf8hjYBIPjMBEZU+fWaMPDHJ5FDkNwFGfbrcBcSWhnTedr/ceq6LHF4Gv0B0kThPOsnnEsU9xUruJiP7VACuTemXiXViWA6AZsf4dsQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR03MB8453.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(38070700021)(11063799006)(4143699003)(261022075727099003)(261009223027099003)(261021135927099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JmfiDbG6XRFq9QWSwkKafALQn+Hawx0VBsWugUSkUIJv9OSgQp7Nb/ydIt?=
 =?iso-8859-1?Q?bhpLm4NnbC+rvxQcAYIxhMzgX7n7EWEK7ojFGKGG3W2tf6NbKex4u9oyCV?=
 =?iso-8859-1?Q?pGOcwDcr6r9G1xcgAB1AR/mQt4aVLBEr9qPh3D5Q5TxRZOJDS3pKDcOZCq?=
 =?iso-8859-1?Q?kSWcADDfdgIsiRhDUvevBLUdQE1kUMXZSV5QPJmtKGGCKwMfkPr/Cs3ujY?=
 =?iso-8859-1?Q?+xrr0xLFWy0+wK8DzCG7USbVGxYY33vZavImBYrT8vXfPAuUKyX359qGq/?=
 =?iso-8859-1?Q?D+l4YPkkG3Toe1BzsM3J7lEY5WZlvPg11ZsQjrBWt6o2OVZoqXDjW2hYnA?=
 =?iso-8859-1?Q?J7fN8y2ikZtdSNzW7elAF2ZQlbT4whyLFtvdJTSQqKLfGrmu7hjx/hq5qC?=
 =?iso-8859-1?Q?w6LWNqZcAkLWaTUxddbG4IItNpNdHEtaDnEHJR9LU6MWuOdOZSRHomtgwc?=
 =?iso-8859-1?Q?m0mVlzVLUygMdBtcxgykyMHZ5sKtN6+S2mSIj4Rix0gUxmTt1B7gN1zX2C?=
 =?iso-8859-1?Q?kj0QNQqLvn6QRbpbuWxROXzLdXrcQ9YDEEmCih+KLdhVXyTYIzB1qMALUv?=
 =?iso-8859-1?Q?wjn3qVFm5jD+1xXVnuf2liJHWGqqiLdQEnjsbw3uQ+F8yvF8ka2TEd/9UO?=
 =?iso-8859-1?Q?e3IQRVqQ6x5JibtLvEGh2Qd8+z9+BynBe7bUlnHlCCpmJf4oJoUlwaySSi?=
 =?iso-8859-1?Q?g1ZoGeMsQICDQlBftt27/T8Irif5SA5hcTbd+F+HzMSidPQF4WETnn87uB?=
 =?iso-8859-1?Q?+WrNgQxKeDCRHxb/CuV8uCvn4L1N3JmMkvo+Zhahm7m7oKWWZyqEWVvFpi?=
 =?iso-8859-1?Q?HLJW9sbdpE952unOhABU27oxkCOeyM00gEvXVhBvGHibbu5XY0eyo4NyBg?=
 =?iso-8859-1?Q?MuDvF+3BDl2kM8E2+m65MqzOo0kBe8F0MWNVUuU7Gw2jbJf88UftRC3uvW?=
 =?iso-8859-1?Q?ApN3grVC+8d6KDYVAFA9EjuGMnzem4e9d/UO80bdWKR+8nQSkRWIVkSWLg?=
 =?iso-8859-1?Q?VTjqiwl9U6J9hqepF7RJXKarpnhiD2Kz5P9EZbl8DmlJvTxRkxidXvwwix?=
 =?iso-8859-1?Q?3av/wmtTFYwD4eRSwywwttVjIMkeb7J2VSwws6O7JszWo1YtEVMKP41B0N?=
 =?iso-8859-1?Q?rkZCvq3KexMOInKyPM2bxw89ITMPfL1NnMWpigbHNgSs8rQQ1UeNC3thjO?=
 =?iso-8859-1?Q?AJrwr7ZWwBrzwzDQlF+mfM0dnCe78/f0AsMhEKqFElprFJ9B5qpTSZCB9t?=
 =?iso-8859-1?Q?98gf3EPpMZuIidxRmBnncYI+bUXC6+Kri7SMXFkuiSd7RsZll6R03Ym1eq?=
 =?iso-8859-1?Q?68GhYaYxTnFxamWfaI8XHu+OHk4ZbxwqP/nj0AH/DQ6pVRMJC/OXAf/NkQ?=
 =?iso-8859-1?Q?RnJtszhlKHhSPDvgeyu14vu3kyNnSbHf4Swmq64S/KvDwU5MsZqpohrclp?=
 =?iso-8859-1?Q?GYyk6vmObDSCwyvGpIRLTCmsDIk3v2J4rMQ5JxbSbDIdyZ61473MtzIojo?=
 =?iso-8859-1?Q?DCn11L4c6hKr/9vzxNxEaSKqEiWdobtx+Nq93njaEA53xaTXGkSPmwf60O?=
 =?iso-8859-1?Q?W6I4oMfKW0uq69f4Ido2vx6rksMzZHVyR7gtHGU9pwK560INZSgyDmv+bl?=
 =?iso-8859-1?Q?BFPPFMf+8wbsxSv5HDaElD9hzppMnH7PHNmEtFn/uGxYvZXVrlARR9esHI?=
 =?iso-8859-1?Q?kOF7LH/HOkDBiqCE7ughXPiRoJobj+rpQrD1IcYoZDvNG6nhEFu794YNID?=
 =?iso-8859-1?Q?J94D+QUMW9VU5t/PrZYf0m9GM05WkSJDhvtH1Q/sLvMkGcLWcol/zhcUTd?=
 =?iso-8859-1?Q?uoSJwAV5iw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	0HXuCogi0iBDIHOjOIbk1YBmSwDwyIliy52H1Bd3YqehAfo1uVFUk/mYOCzM9l895U02VOz6Ny17Vybasi5J6p3VbToxP3z2TeJdOtRUadxezLHLYcQpPAK5CGspdALB4Lp2mXFvFW5fCVKlNc6ACA776PFF70uChM5vGNHliQs5KsPoz8NgRqF8JFSBsOMkvP/13jub4yCzxH6KqnahsqehsiDoIm9ZWdphBujiH30SGnUzwcWcnLDz/CphDbsksqm0n9ShLmVr18xrQL9jnDRaSpCyS7WFjagof9+R8FlWe8RT9s11MWs5OUU9YUN86WIfJUHZISLfiJBy1JkNqw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR03MB8453.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cd0a60-334b-47b6-9ff8-08df3bfa4fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 11:37:17.7284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SW5O3RzZmL3jw2n6mbjHNdXz0B+wwow2txPlJ8ItWbqx2yYKIYsGJt8y/x8XnBZkjP5juxdydzuzSjvnmoHe8XION9rmwjZ/DeeTHS354ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPF393250B39
X-Proofpoint-ORIG-GUID: 95-4oYqCSSe_AJ9w1sfuwRQpcjSRwp6w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NiBTYWx0ZWRfX9P11gpzvrJNm
 p6jwIFnDWpDozvdyJ9hiZlvuRPK1tUv+b7OGWFDb1Q+TJIlHVGJ0vyjbcX1Y6skVfmwPD25qjOi
 b1i8aYlvL63yphxcp4ILvphLetTa8U90Gkdh+6K/Mnd0LhUk5GDC
X-Authority-Analysis: v=2.4 cv=Lt8HWXdc c=1 sm=1 tr=0 ts=6aedbbef cx=c_pps
 a=26rO91Bbw6QoawbNyte6AQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=216Bf74jvTWdn0gRJ0gA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: 95-4oYqCSSe_AJ9w1sfuwRQpcjSRwp6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NiBTYWx0ZWRfX8C5fJ29FiSYu
 hdbpq+muqeHFe101+llYMWTutb17x68QhrCg7k2WAv7SfoFlfufS5L/KTL0El2jDfO3OCDzpiJ4
 TP4+CXb9tfuFQOq4iL5QRU7m47uVi4p4SrhvjG71/x7eWQy2DAY3+EugTlrJtUyh+95BwLoCUPv
 cTiwRFxfPoAWxiDftSFPBfKrSkVriCpqieijdtr30i233mQqb9gSvQWyEb1IDBx+zZcW2sB7VHH
 qnZh11g/5MwN7ZynR+E7y0Kx1nKTQ39tCzpkaG0igd0NR9P8ufHP5/JSB837PY2Zg/NKMF+W2yL
 815de71aROnfmASvj1yh9tnZAS7FesiKlY8wp+aFlD/7tyCeRYsZr03Dlj+mWcikqaFVeO8p5Et
 FpPYlqmAVHR+z1zNRTE9H0yu7YaBu6SXP7xddOcCGvrQ+ZLlwewhbkYC5RwZcqAMIEQIbIFNJA6
 dNJG6uIyiJ0MXMPU0fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060046

> Because neither dev->uc nor dev->mc is programmed into the hardware MAC=
=0A=
> filter slots, and ADIN_MAC_MULTICAST_ADDR_SLOT is only enabled when=0A=
> IFF_ALLMULTI is set, won't frames destined to secondary unicast addresses=
=0A=
> or joined multicast groups (such as IPv6 Neighbor Discovery solicited-nod=
e=0A=
> multicast when IFF_ALLMULTI is not set) be silently dropped in OA TC6 mod=
e?=0A=
=0A=
Yes, I reproduced this on an EVAL-ADIN1110EBZ. With a socket joined to an=
=0A=
IPv4 multicast group and 50 frames sent to it, none were received without=
=0A=
ALLMULTI and all 50 were received with it.=0A=
=0A=
In v2, adin1110_set_rx_mode_tc6() accepts all multicast frames when the=0A=
multicast list is not empty, and the OA TC6 netdev no longer sets=0A=
IFF_UNICAST_FLT, so the core enables promiscuous mode for secondary=0A=
unicast addresses. Retested: the joined group now receives 50/50 frames=0A=
without ALLMULTI, and a macvlan on top of the interface switches it to=0A=
promiscuous mode and passes traffic.=0A=
=0A=
Thanks, =0A=
Iustin=0A=
