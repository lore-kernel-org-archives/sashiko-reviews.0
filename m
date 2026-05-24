Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023082.outbound.protection.outlook.com [40.107.162.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA2249E5;
	Sun, 24 May 2026 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.82
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642668; cv=fail; b=OhJ2daE8ASblmda7DELGhnD5FfKYAorgUhAa+x1GFZIZzMtK3lGXAsN5Jubf0HD7DdbLNukouMQgXChGdtropMOgIDU8EgmUsi1OEpeQFA3NrEKKHuQ3z/WsuofD7mymfb2O5HHz+x3JOexF67X7Hgd7W8t4iFCJ/xJKfQ89Gwo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642668; c=relaxed/simple;
	bh=pi+ygmg16Mnvo/AQk8yxZzNcvUpcCaPH1JBVl/0Wic0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SJT9RkU+hy9ivNHhbUJ1nJZmxTr3Gv/D1qhvKq+1vHT/4K5hIjrNQJS+Xkakg3NUUFc8rI4N4HgEOTnP1CMC4xVfaF1bHvjr4Z4sNU76/x0k89DAIDf356fkmpF3FTU7b4GoCDOd7ANKJt84WcaN22vhDE8z7xF9EhuLqFICdSc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tyTXjMM8; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tyTXjMM8; arc=fail smtp.client-ip=40.107.162.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tyTXjMM8";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tyTXjMM8"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Esge5vZy7Y48sRVoQ3THa28bfKCS+zcOueWe84XM2jFlCWGvNFw+aVI/8d67/1Ndn7VHMss5LYiE8qQKZ373urNezie8k4VsYOcGlC1vsJ3n4QfajgsHbTm33BxCU/4Ufw4XJ36Hwq9edN8uEBicqduViZQJ7oTqd1Y86sazutgW+xuT+k765egtejB3EiDarXk+ZcGMOjhxJSTpad09WJJbvU15Eq+wp8MTpYDuV5AL0NPPypJkymQiTVArrSUHpiKetY7WVTjjtPjD4dGZhLUshuxetX3FuxEXmJA+drR1uiPkDBS585dxrhiLWJ2N6mCBEWp89SsUWBibLTmqPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi+ygmg16Mnvo/AQk8yxZzNcvUpcCaPH1JBVl/0Wic0=;
 b=O0Gnx/jNQ1gqzvMczuTqGRWLmqOaFFlnKFGWojMaeP6bwvKVkIH+FVJ56v+casKtXk6BWLStcopFiA/zj/KjDw6eIkfSZPdlfdT2fpq/8n2MJJtW0zCiD4lMQEyXUvglIIbLblBdM0sSeRrNdWEhZ7jljcV1Ei5okAar2kIxdsbQHLwG7dqN0t93y7LDWRW7z7db+CjX9izpCu+YjUgP7oKQYjy04EUrGGEUUDUfKy65lATHVVbdVBZ/V+KYlJob/kAx3gHCQTNKG32P9OM73DbF8Smu/kn6kSPIxFqrQSpHYuyJreJiHNq8AKvhyOW9uBXg7383oroIziAISGoTiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi+ygmg16Mnvo/AQk8yxZzNcvUpcCaPH1JBVl/0Wic0=;
 b=tyTXjMM8Wj0GV82hYFbs3FvQAIv6lNXvO2b8gGk8G4kg1Af9lqBCKvQf12uWGzWMXsHLWqpBpKCS0GhM2Cp6Ovm87oqK8L15HxH0g4ulNevLl7ewRaSEbIPYxXA49B7FYq694PEHxjSsrx218Zqos42spClfCwKKKHBowkDiOYXxgNGD7V6OiGb05GIRgpIPxlwMGqxiPVkLbW+lS8VytOTH0q9ATOKyPoeXEhBfJkOwUT+3vW0oYsO0y/Cq5ktibAwhEv0Pa/jofFv+J2mWdizgdHDGbp2Wr4ZaVqC+N38PZyX0TeqkFM3jXPDH7G/xht7pJwqrGEe3b26xmVheJg==
Received: from AS9P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::13)
 by VI2PR04MB11049.eurprd04.prod.outlook.com (2603:10a6:800:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 17:11:02 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:46d:cafe::96) by AS9P194CA0005.outlook.office365.com
 (2603:10a6:20b:46d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 17:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 17:11:01 +0000
Received: from emails-2478096-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 823B97FD73;
	Sun, 24 May 2026 17:11:01 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 17:10:53 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzxbRqEgfdNOaTELFFf2Pfvb5Tq5GQXttt3IrTSRrPkwhStZL4j+Ac1vWz+DbTNt6WE3cPf6R15oOBYZYqZij/iCbvuDxWer8xMx2ws5CbDm5LBOq3mRGReV0Q/cbwNo00sCkZ7OLT7w5IkKnkuY3lqUexyaPWdogsRFHyFKOqSx1NXI+fj8S5OG5W/5hf7nLDscDEPU8YpuTjT4HvlSzE2I9MTVgH17HV4soO5xwZYRW9gLgm/mSQEXntoPRibBFL0lviKUHEx6HKbfysPmtq8n9xKLYVxhvgAsaBKYzUudWmuaqGiEnihmDGw/oJWbQHb/I+8sOOHwc3ZKFjl/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi+ygmg16Mnvo/AQk8yxZzNcvUpcCaPH1JBVl/0Wic0=;
 b=a5qRZR5w/tNqJG7E32yanF6hLYNhxg+5M6jk5npme93/fHNdHx0iMfftxloQCZZMecwAv4DHOnvsWU9aaKQ6fmj5sDbGYokplFsr+AQS2BJQK2SLfJ7gqUTtJ6EUBo3fmjrWDlWVKwS+Q+5Y4NMPqAHB2S6XXjekdWrplUa87XLPHFA6neveP2vAQ5Adx+Jz5VnU8mTLNhc9E0X0fAchFXw2KlFWlIpdhK9OGD7FJvm9EX0mcdPf65/DSCPTbdSnwDxKtWN49N+55ESuXiN5wLu6iVRwekiwlRCpSgtfSzyX5NzvJscZ7Gy7V1bEmBb1/1KUloAorbYmc1Rp4dIEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi+ygmg16Mnvo/AQk8yxZzNcvUpcCaPH1JBVl/0Wic0=;
 b=tyTXjMM8Wj0GV82hYFbs3FvQAIv6lNXvO2b8gGk8G4kg1Af9lqBCKvQf12uWGzWMXsHLWqpBpKCS0GhM2Cp6Ovm87oqK8L15HxH0g4ulNevLl7ewRaSEbIPYxXA49B7FYq694PEHxjSsrx218Zqos42spClfCwKKKHBowkDiOYXxgNGD7V6OiGb05GIRgpIPxlwMGqxiPVkLbW+lS8VytOTH0q9ATOKyPoeXEhBfJkOwUT+3vW0oYsO0y/Cq5ktibAwhEv0Pa/jofFv+J2mWdizgdHDGbp2Wr4ZaVqC+N38PZyX0TeqkFM3jXPDH7G/xht7pJwqrGEe3b26xmVheJg==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sun, 24 May
 2026 17:10:49 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 17:10:49 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH v7 9/9] arm64: dts: Add support for LX2160 Twins board in
 single configuration
Thread-Topic: [PATCH v7 9/9] arm64: dts: Add support for LX2160 Twins board in
 single configuration
Thread-Index: AQHc641FDjqhGsMoSEinbMza18CHC7YdWziAgAAONoA=
Date: Sun, 24 May 2026 17:10:49 +0000
Message-ID: <b2245626-7686-4179-8282-3a4780949cb0@solid-run.com>
References: <20260524-lx2160-pci-v7-9-09370c23b952@solid-run.com>
 <20260524161958.342981F000E9@smtp.kernel.org>
In-Reply-To: <20260524161958.342981F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	DB8PR04MB6859:EE_|GVUPR04MB12217:EE_|AMS0EPF000001A6:EE_|VI2PR04MB11049:EE_
X-MS-Office365-Filtering-Correlation-Id: 84962239-8c42-4db4-709f-08deb9b76e9a
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|4143699003|18002099003|22082099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 4pxwJ2yH2IAL0kkjnaJcev531R7wD76JEdtsnky6JTQrwNimael2jBX6tAHCzLTbYlbaKdPb/28QHspGAUADMvklP1IhjDYhV+qTQOYv8YRXhRsfJTXNDpSLyIltHbMHIQKi/Bf3fq0nAvwu1nIoZOzuQeoA+0QxKT49HzRYoeTW/LugDyduY4p467noYX2q/LDs2VVyasMdB/fvqKzQkS05fjcPSJvNtIe6Y+M3ODzyaf4mODEMpWdmem+H5x02YIu+GWwbszLw9FoaWF8oZR/MweSfhbrPbVDWPcKvu2NnQpr2h+Q+4qqhqdSG2M69DOR2tT6H48I1TPSYBS3r0Q9VDLaWAlh6TDAE2hzLxx029P5sX041UxfASTytdqkFuoEaRiP6beiUUUvaWYIfZgBe1ni2NMLBqExhOgg14u613Hl1qx+MHizdpxIMJqQULh1HUpIoPlczq6FdnImiPy+kWjvFrGI9NsbV0smHSHVqL4KlHahWwU9fCEK7LqYnvp/BykN667bYHwzQcSjk1cFaFEGuaQP7WyT/istH0I4ZHbJPVoiGdnzkHB0I63HYzZmQcfLqM4AkcXQIXaRsOXl4X1rQvYggL+BHu4iiSsIE0tnIf5dr7mMKyaGM0uwg50tuHPv3CF2hDUUMqEiM8C8BJLhyIb4qO+dKOIxxiR8CsLPs0vvCPzpU7nKA4DQViJ5sh+7PTKPFk124jKRmz5886CuyB4nXbL25ApMZC741pKTRe6bPhB54zJKkz+H/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4143699003)(18002099003)(22082099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC6333B7945FA2458E5178B04166C725@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WbEePkKJhQsQhUUbFJn0F1B51tvmCdAtVC0YSsN8qGOqu2qq3ZNIRM7KcRcvp+pM/pFRDA+hihfDhuA8CQNrA+85dR5QPUtDeltXdGBoUFOzbMCKp7tFIl+2XbqTnd7TKQcsT3jlIpgJsxgj1Yo1uXpSXceHnSYQGXIH8tsA+9gEP1rWLJ8Jdj02koKFlaCc2ES6APfFtLrQgU+OFjZsZI9iBJQd3MB+xio4leGbKu7y5yv0W7EEmyACk3larZol+1P6DCMvJkIR2uDynGvDU0qP7qXzW+uqGCAWTOJ/EJ+cO+StBj+CTPlGOvWS/E7aXQP6e4afyf4F/PeNokT01w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b584dcdc972744d9b92037f3c69817e9:solidrun,office365_emails,sent,inline:f6b2c820d9f369e5fb82506a4e5466cf
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f9446725-4bec-4f80-ecdc-08deb9b76758
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|14060799003|1800799024|82310400026|35042699022|22082099003|56012099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IInc5SoRkNxvLeqT1vpg2/x5Hn169wbipVbyH2YAM5Xo/qEBBf33wud7ajgvxRWPMA0Gc8Ke87ZcnkWeST8FBHiIxKLFype6cUDAfS2g+KUBFjL++2sXxppkLtjHKV1W0K9+BH0/ECG82OOkUSxKJEMMmbt0jQuo0kFwI3y2ncYNi81+AnNOYSUHAfHU7o7gk5MkRXbtwa76SPgWxMnrDuxeoCFes5zOgv4ifa8D913Y6iP25MGjeFjAZoWhnb+MSO3MoSq0LnQedVRJuBhl3xcVlq8Pkz70ckagk1j/P85ZNgunT34ISG0fmk52g6ZrLPhy5nbDkqRLol1bxOcqxjeSLIN8XBIA6CKmJdyq/KQuIMHL9UGa9Ok3j+ld3KUnbvuExqYusrbw0yQuwp6iWhKdNP+sBKO2m3ODW//JFjj4aWoRW//amQCqKF5k9ojttJM7Azmb+QFFy+2rssQYyiqu/ltAoT3XbOyCh9WPqfNGcqRX3WBUcRXizrm+BIjV/dMDVxrBeXPL1nXepGXh85x0KurltRK+cB2aDAoSK5xNBps1QlHSBf/ARguU/MNoIFO4RxWShwsMoL3GR2SG0Q/+6eAJvAXafswMLA0XsTuyvepKiecE32janaKXmNTVVIfyX60asPiSiLWpftdIVeGKUo91VaVWR6q8lhKgGXnTb9vq1EzL96t5UGUXlcqWto6qqncSnY+0D27EntQQ0ZTtZGsWoNTwS0tq3/ddkP0=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(22082099003)(56012099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vow8YJtyrbC2/8nSU14FS7cXcFwvYiS70KJv6JtXQzFRJN+lNSq0E6Yhq6klZjTJzDSZEjuvi8AMkFQbX8eg1dMgTS0MCFqApmPDgiqtSs8aA69t5owbCQeVbZZL8jxJgEp/VNauSsA42JfocWNtLLXP62Jld6PyhWPZlRsLOz0duxLZuOq+H2apx5KvJnMwdMvDU4zvYAIm2KmZvYgKq00WVObexgm/wOnWl0n/WA6zmzOZj6wWhT/SxriHC4aS1PsYRy4dESFR2EdJaUXZrBYxGPZtBfygChCT+l8n0j/ticCEd2m+/sjpIaWU2C9OzE+XX3oFfCCkzpC1Jjry+I2mQM4J3H8o8iMqgYFlfUvp7k0sgzxHtYeAh10mSeIaexhaD6wNZKG56q+fOccLZNz1dtkSsRu9ChxLLOd+Py45ye+3WwADCWIe2p+UehQ/
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 17:11:01.7963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84962239-8c42-4db4-709f-08deb9b76e9a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11049

QW0gMjQuMDUuMjYgdW0gMTg6MTkgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTWVkaXVtXSBUaGUgYGdwaW8t
bXV4YCBub2RlIGZvciB0aGUgZmFuIHRhY2hvbWV0ZXIgbXVsdGlwbGV4ZXIgbGFja3MgYW4gaW4t
a2VybmVsIGNvbnN1bWVyLCB3aGljaCBwZXJtYW5lbnRseSBsb2NrcyB0aGUgR1BJT3MgYW5kIHBy
ZXZlbnRzIHRoZSBtdXggZnJvbSBiZWluZyBzd2l0Y2hlZC4NCj4gLS0NCj4NCj4gY29tbWl0IDNj
MjhmODBkMTNhMTFiNGJhMDEyZmE5MzMzNjJmM2QyZmZlZWM2M2MNCj4gQXV0aG9yOiBKb3N1YSBN
YXllciA8am9zdWFAc29saWQtcnVuLmNvbT4NCj4NCj4gYXJtNjQ6IGR0czogQWRkIHN1cHBvcnQg
Zm9yIExYMjE2MCBUd2lucyBib2FyZCBpbiBzaW5nbGUgY29uZmlndXJhdGlvbg0KPg0KPiBUaGlz
IGNvbW1pdCBhZGRzIGRldmljZSB0cmVlIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBMWDIxNjBB
IFR3aW5zIGJvYXJkDQo+IGluIGEgc2luZ2xlIENQVSBjb25maWd1cmF0aW9uLiBJdCBhZGRzIGhh
cmR3YXJlIHN1cHBvcnQgZm9yIHZhcmlvdXMNCj4gaW50ZXJmYWNlcyBpbmNsdWRpbmcgU0ZQIHBv
cnRzLCBPQ1AsIFVTQiwgbWljcm9TRCwgYW5kIHBvd2VyIHN1cHBsaWVzLg0KPg0KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLWhhbGYtdHdp
bnMuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtaGFsZi10
d2lucy5kdHMNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAw
Li5kMTZlMjczMDcyNzU0DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS1oYWxmLXR3aW5zLmR0cw0KPiBbIC4uLiBdDQo+
DQo+PiArCW11eC1jb250cm9sbGVyIHsNCj4+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1tdXgiOw0K
Pj4gKwkJI211eC1jb250cm9sLWNlbGxzID0gPDA+Ow0KPj4gKwkJLyoNCj4+ICsJCSAqIFRoaXMg
Z3BpbyBjb250cm9sbGVkIG11eCBjYW4gcm91dGUgdGhlIHRhY2hvIHNpZ25hbHMgb2YgNiBQV00g
RkFOIGNvbm5lY3RvcnMNCj4+ICsJCSAqIHRvIHRoZSB0YWNobyBpbnB1dHMgb2YgYm90aCBDRVgt
NyBtb2R1bGVzICh0d2lucykuDQo+PiArCQkgKg0KPj4gKwkJICogVGhlIGZpcnN0IHR3aW4gY29u
dHJvbHMgdGhpcyBtdXggYW5kIG1vbml0b3JzIGZvdXIgZmFuIGNvbm5lY3RvcnMsIHR3byBpbnRl
bmRlZA0KPj4gKwkJICogZm9yIGl0c2VsZiwgYW5kIHR3byBmb3IgdGhlIE9DUCBjYXJkLg0KPj4g
KwkJICoNCj4+ICsJCSAqIFRoZSBzZWNvbmQgdHdpbiBtb25pdG9ycyBvbmx5IHR3byBmYW4gY29u
bmVjdG9ycyBpbnRlbmRlZCBmb3IgaXRzZWxmLg0KPj4gKwkJICoNCj4+ICsJCSAqIFRoZSB0YWJs
ZSBiZWxvdyBtYXBzIHNlbGVjdG9yIEdQSU8gc3RhdGVzIHRvIG1vbml0b3JlZCBmYW4gY29ubmVj
dG9yIHBlciB0d2luOg0KPj4gKwkJICoNCj4+ICsJCSAqIHwgU0VMMSB8IFNFTDAgfCBUd2luIDEg
fCBUd2luIDIgfA0KPj4gKwkJICogfCAtLS06IHwgLS0tOiB8IDotLS0tLS18IC0tLS0tLSB8DQo+
PiArCQkgKiB8ICAgIDAgfCAgICAwIHwgSjEwICAgIHwgIEo1MDI0IHwNCj4+ICsJCSAqIHwgICAg
MCB8ICAgIDEgfCBKNTAxNiAgfCAgSjUwMjQgfA0KPj4gKwkJICogfCAgICAxIHwgICAgMCB8IEo1
MDI2ICB8ICBKNTAyNSB8DQo+PiArCQkgKiB8ICAgIDEgfCAgICAxIHwgSjUwMTMgIHwgIEo1MDI1
IHwNCj4+ICsJCSAqLw0KPj4gKwkJbXV4LWdwaW9zID0gPCZleHBhbmRlcjAgOCBHUElPX0FDVElW
RV9ISUdIPiwgLyogU0VMMCAqLw0KPj4gKwkJCSAgICA8JmV4cGFuZGVyMCAxNSBHUElPX0FDVElW
RV9ISUdIPjsgLyogU0VMMSAqLw0KPj4gKwl9Ow0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gRG9l
cyB0aGlzIG11eC1jb250cm9sbGVyIGxhY2sgYW4gaW4ta2VybmVsIGNvbnN1bWVyPw0KPg0KPiBX
aGVuIHRoZSBncGlvLW11eCBkcml2ZXIgcHJvYmVzLCBpdCBleGNsdXNpdmVseSByZXF1ZXN0cyBh
bmQgbG9ja3MgdGhlc2UgR1BJT3MuDQo+IEhvd2V2ZXIsIHRoZXJlIGFwcGVhcnMgdG8gYmUgbm8g
Y29uc3VtZXIgbm9kZSBpbiB0aGUgZGV2aWNlIHRyZWUgcmVmZXJlbmNpbmcNCj4gdGhpcyBtdWx0
aXBsZXhlciB0byBhY3R1YWxseSBzd2l0Y2ggaXQuDQo+DQo+IFNpbmNlIHRoZSBMaW51eCBtdXgg
c3Vic3lzdGVtIGRvZXNuJ3QgcHJvdmlkZSBhIHVzZXJzcGFjZSBpbnRlcmZhY2UgZm9yDQo+IHN3
aXRjaGluZywgYW5kIHRoZSBHUElPIHN1YnN5c3RlbSBkZW5pZXMgdXNlcnNwYWNlIGFjY2VzcyB0
byBsb2NrZWQgcGlucywgZG9lcw0KPiB0aGlzIGNvbXBsZXRlbHkgcHJldmVudCBib3RoIHRoZSBr
ZXJuZWwgYW5kIHVzZXJzcGFjZSBmcm9tIHN3aXRjaGluZyB0aGUgZmFuDQo+IHRhY2hvbWV0ZXIg
bXVsdGlwbGV4ZXI/DQo+DQo+IElmIHNvLCBkb2Vzbid0IHRoaXMgcGVybWFuZW50bHkgbG9jayB0
aGUgZmFuIG1vbml0b3JpbmcgZnVuY3Rpb25hbGl0eSBpbiBpdHMNCj4gZGVmYXVsdCBzdGF0ZT8N
Cj4NCkFzIHN0YXRlZCBpbiBwcmV2aW91cyB2ZXJzaW9uLCB0aGUgdG9wb2xvZ3kgaXMgdG9vIGNv
bXBsZXggZm9yIGh3bW9uDQpmcmFtZXdvcmsgdG8gdXRpbGl6ZSwgc28gdGhlcmUgaXMgbm8gaW4t
a2VybmVsIGNvbnN1bWVyLg0KDQpUaGUgbXV4IGV4aXN0cyBob3dldmVyIGFuZCBzaG91bGQgYmUg
ZGVzY3JpYmVkLg0K
