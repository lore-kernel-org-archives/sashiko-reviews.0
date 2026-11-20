Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151418;
	b=vR95JNYrmlutSL6zmRFV7Ci75fC9HDeBy4HAHMcuhsbxDSk1X9Hegbe55lb506vm4e07
	 /C0c5CIG1mRnzRFML1dohNj++xHNlBoHiFdNG8ZfIxf2lMbzJbYz1/GKRXQNSA9JX72Jt
	 w7DLhsHxk6HyXi2oy4IOrMvMqq4sbU5IcrZVYQAQQmq7i8j3CS4thjek6Ww6nDsJG13E3
	 NXaW5quSeQjO7VfpaMcdCDLT7NgQEEZioKULw/B+mBjKUO2I2YeB7UNDHypWxajka8kum
	 LgvxBKNy3AMe9/8eUxcRnPhRPA6X4fUw++GgJP32obLQ4ga4h1lnlVLcHZRe4yvUXSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
	b=bqkmcWXo2GTCZTMqfdJ+16GbMzR0Xs3MeQFWim3RBGJV0NqA++iljzBHRqc97U9sNYOT
	 IHkZj+qXtN4V4eTDb8tIXazo2g6j/lsnS7f4+wJi4zZDneE/sMKj2N6wRnclfbVDOFKqd
	 4lNnTvAcDgqMmR6sxxblI5iW7V610Sn018Nn1tkgZKPyHO6R3VXwpYuRYRhkGt7SOEiLt
	 0aycnTLrF+sKd6FdrEbozX2Ug66ihkzOh4/5MpD9dEsMCWuYm/eS0RrmE+dohR+N721Ib
	 RrBDYX3CgtpUOlnLmeD4crhJl7YSyk10Ay3Y8CrWa3ovu5uKE5VwJKhljz3kwRPfRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KF5uHerQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfLbAlrm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CCF606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82CCF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KF5uHerQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfLbAlrm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK4r4eh734581
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=; b=KF5uHerQnQnfOptU
	9I+G9iMAvwaZgtQNcgAClizK3HMPx5kdyZMb0W0ZlnlnL+i0P9UfHW+Q7QKtRIlW
	FMT2sf2KBNE1QSNeNcCOoHcEvn0+Lsjnxbi7tJbvWdY8TEgTevbebdcDniwOv6kr
	ssC57EYJa+eyQZvaUr29xtIx14/uVkZWkO3YqQpfalYDV8f029uh3h63yaTb+9XQ
	b8YX8mp8J0OZnhtPepGy8i1qILB+WNpynJ+ruinAyEfs+kn6cSxBmAOvQTIEWZQk
	Oh8E+9JTrHaTa4P+sHkHyUqyXlU1GzCTlFyAstWc3V6QjjqHmPhhGa18u0Qof9nk
	LSVUDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtr1u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:10:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so471396b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795151415; x=1795756215; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
        b=QfLbAlrmo5x3RA3RvJDZBThFZ0iK5I70PG3HTJhpct0vJoPb5eRXVdDaVUpGG+3Qw/
         6+amGmQH2SxjXJspMs9S/XP600+GNKb9Ql91HAXUKgL9GOJSRCQFoljGpqjh4ipsmyiG
         L313AXNmCQeamVU2eROlnlhxCxNpXXltTYOYhw/VOqIpktAJXPVzEtAxW1xQJo8QDqV5
         b1Sw3tTz99MXSwCqvsr/oB2olYVHEFIRk5O6SZArBYvqTiUlSztsoXp2vDHIgI2fatRK
         10f+EWNNh7MDjcpTkxO8IWLNskIExfmfzeYxcDVmLl4FUDPrXkoGezUfEfiJRAz2hXBW
         h+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151415; x=1795756215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Zk2KIRwTz1BoEqg6euwnZZFOAKnOCtValMdoxSVAys=;
        b=M8u7wRp6P4ioZ5U6L2WMBIQLpSccTqJp4FkGewOcm0PvUQnVUyyR6NuSTnwGx1YR1m
         HrnlbzOwUpffNJ/99GjnAJxDfFnwHgLWFoegIfEYiEVnKUx7PH1u+/xniLnQxnk2UcI0
         JX5E0jE541Nc36WKypyirPYgVyQZ+jO6kdMxDTbSfP9ZJZbqA80Eu4TmCxCHH6LsgbKL
         1ZW1u4HIKRkx+BEP8KUyVbL1/IbVuh+2250ACLEuz/IrdrQjbUTeKlqMcf1EyW3dsXGu
         yQDReVh3xtuPzsSBhCr+SJUAP+EL+0ZGZGnNY114GliXXqzA1dLc1QJCfEELEQr9RjMJ
         Dsiw==
X-Gm-Message-State: APuU4Z+4vgy9tyGX+KMhVinVpUlDVbhVvFFmBx7gncASuyhbUeHvgGpB
	tiZkOf59i8+ekJVSfPQB6OckzpIiGnMIGKeCT8JBuX+uf/WeZSiOpHqxx1ukuR9rYaF2lVSn0si
	LURJTljAeKYkDQ/vRwxFiC9AFPnJk9klt7CZnPmHjVP0hE12j3dsftOHr3WKkbg95hzKHRolsdj
	+/Jo0=
X-Gm-Gg: AYBFou0hqmvcAYfQLb0zBr+j4plRJ6RSJc3iMo7KdarR3z7vhuKA3Xd+tlcVPt0ZAmo
	9MPIggG1D+d9GLmuZevivQX9KxLS2me+B3JiNIj+DUIveOgvWaZyPbwLgZDAf52PKMytHg+USj3
	wBr+IqxeeGG9dsfA2/nfY6a6J1s3doWqF/8SRshSY7R39w0O9KWxzRhNpgts/5cKzhtLmwYNquW
	76PkIhEBTtcx3Lmk8TTbSG3xNaYzDC9qT+cmNSr/IVL7rMeYO/hdHq6DLRLybWqzS1dbZJMZzBp
	TBZAY4Uv35bE7IRomJRaax383Mv5HKQfATUy7Z/l0laf98FeJNldasOuFyzEu2gY8HRPorbUtEq
	S3VojUsSKkPrEjyXDAR65A+5toVCM1+kvvq6DAbXiGXR6ZByS+P2IyK/Ryr7LY6nI1b4a+meICY
	pXiQ==
X-Received: by 2002:a05:6a00:3c88:b0:8c7:c13f:9ad8 with SMTP id d2e1a72fcca58-8c87c85ef62mr1552242b3a.30.1795151415173;
        Thu, 19 Nov 2026 21:10:15 -0800 (PST)
X-Received: by 2002:a05:6a00:3c88:b0:8c7:c13f:9ad8 with SMTP id d2e1a72fcca58-8c87c85ef62mr1552223b3a.30.1795151414675;
        Thu, 19 Nov 2026 21:10:14 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm863722b3a.24.2026.11.19.21.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:10:14 -0800 (PST)
Message-ID: <5083f607-afb9-4eb0-95d1-38cbf51ba5da@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 10:40:11 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
 <sashiko-outbox-223366@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223366@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fSeKwViISTeMqTJiaFBAlBafCicDcuzO
X-Proofpoint-GUID: fSeKwViISTeMqTJiaFBAlBafCicDcuzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfXzoy4Jr6CBt87
 J3dPPaNoCAU8k6z4pPBH9vP89OzlDnScNZtBR7kQA7E4pPHQY9BB7lxb8aUdyM26Pd/EPKDYOFa
 DmV/FKmU53hkivUV8Qa4pFs48ZvHITGDFbaFW9HozjDiPML7CNFPphd4cqC5QJ4dVQGbW/6Dyy3
 05P73dkLdKbyfEtZzGZiS4WATl2TukRfqX2TdYzYtywSJ8S2wXPBNdye9lWoI1kFsNaX6W9e2lI
 Jngnz0XUvgEsdSmWfVXCAi8O77NtHFR+020xhJgjxT0sxv29lCbry9yDxxaSbBvJ8w0ShSv/DE+
 KcaMl2IB6tpN59zuUpqfFmffFXglJKNPkP8/jYnPOm4mYS5h6Gqp7GF1HC0XQmWpDfHxP/OxwkB
 6KeAT7FBnoc+SFuBP+/+Hi5QGnW0zmSuCv+nvbCCI2wAqWE70Yi1bkVX0fluElVGCD0yAwvBtvu
 CSR9vMkxh/vXIzokbYw==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6affd638 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=R7ERM7q0SgTlKnAdGugA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyMCBTYWx0ZWRfX3hshRBjxky4H
 jjnlI+hpjih/Qh4hEXdzUqB1fmIMkMpXW0T71Y1BNTcBPmYT1Z1KauSYbnOJrPgwgXA2ejpMi83
 gTypKDgn3k39QTUEKoeXO+afJbc6EjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200020



On 19-11-2026 20:50, sashiko-bot@kernel.org wrote:
> Can probing qcom,glymur-camss trigger a NULL pointer dereference in
> msm_csiphy_subdev_init_legacy() when no CSI2 PHY remote-endpoint is
> connected in Device Tree?
> 
No, Glymur follows CSIPHY standalone path. So, It won't cause this issue.

> csiphy_res_glymur leaves .csiphy.hw_ops NULL.  In camss_init_subdevices(),
> camss_detect_legacy_phy() defaults camss->legacy_phy to true and only sets
> it to false if it finds an endpoint with a remote port parent named "phy":
> 
> drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
> 	camss->legacy_phy = true;
> 
> 	/* Find first remote-endpoint and determine if its a PHY */
> 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
> 		remote = of_graph_get_remote_port_parent(ep);
> 		if (!remote)
> 			continue;
> 
> 		camss->legacy_phy = !of_node_name_eq(remote, "phy");
> 		of_node_put(remote);
> 		of_node_put(ep);
> 		break;
> 	}
> }
> 
> Because endpoints under ports are optional (for example when using only
> the internal TPGs or before board endpoints are wired up),
> camss->legacy_phy remains true when none are present.
> camss_init_subdevices() then calls msm_csiphy_subdev_init_legacy(), which
> unconditionally calls csiphy->res->hw_ops->init(csiphy).

-- 
Regards,
Nihal Kumar Gupta

