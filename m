Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B57188CC9
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569978; cv=none; b=iTRMiQlUjpCDHK4aQ0+VuUDAkLLMhHXr37MEcLJ4UVGW+9Ng2a+3N2cr/UGHRLqw71FnpcJ1yicvwWESSWnEjtiifjvhoULb+GErZWMLH3oa/h4yS38OaTBN8KNkG2qehNIM6umxEe+gJhxs2E0VlYj82zTLm3JySfEb6WDf9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569978; c=relaxed/simple;
	bh=FrdJBRaiw4/A4tIqj7D9XTkrSF6V6Sol2sFg53+qPJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUajJ1grQvvWvtqChuwWTeDs9Xd+WCZshj0AQGCdYSJFRYQb7u5vAQUN6ezQUDRA6g0E7BXFObmsxEiz8+0POjEYYsCDow6d7wEojEPycZOPsPaBDoN7JXuL6U8gTTeOE9H1nKn1ZJf3+Iap7ExFDDWMg6z/y9wBYq8/gmh6N8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzNmEvIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JrSw0x4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzNmEvIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JrSw0x4a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0O40d091436
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsvYFpY1yLMjl9k9WmpsHGOT
	Fu8DXSJDXlRw/qNDPMg=; b=RzNmEvISX1axtFfTvzEK8jKKnx08L36J39COfgnv
	AoYofnFgDKoQb9BDTKi3kWkyJGXMZBuKjiRfGLeE44VMxNjgPLvYrIG3OBLix4JC
	STTmjYc5EBn+k+labPyk8bS1NhV25nqIF8e/BwG4SYO53GYeOApminWQgGQTH+c7
	Xewn1obmMBxzm3sR9tYxF1HGUz8sZsw9/tR5So0F3Etc8VQyvnAVZ7+IY+nRYRSt
	MDLJuiqp2exjmr2nugqCYQAJChXAaNZrN7Znu4VzK475MNvsI6E7vzSTXjbp3ymk
	6O1RSahsOBhjOCPYYkAdIFU7MN/l0I/fcWoXv+Bi59xERg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983wwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:32:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so573287585a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569976; x=1782174776; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsvYFpY1yLMjl9k9WmpsHGOTFu8DXSJDXlRw/qNDPMg=;
        b=JrSw0x4avg4erwFPE0AeG2QysklLuQOcz9vjeHoDGLAylpP38+RefI/kTiAgwzjOD/
         YADDG/Gg0cAs8exeSmihodciOHzHAfhxd+i/+GKwsq2PirxXW616FN1BKXvNFfEYwUTD
         bvtaQ+fG+DuksbLB1Rf9b5yO8ORXYjfEBALlEXbQZKJAS5JxpH/Kj8L5irMnM9rCT5Ju
         htCkFucz0tRZ2HLQd2DF3jEtNagS8v7Dfmz1IrSk7N5IxiUIFfs43Tl/WL6iTp5RYWE3
         51K7ohZeio8VDgqejqHrFFavcgN3+i0v1AUy70Ar0EWmqWTB56/Sm/NKtXn/Mg7e3LR6
         BDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569976; x=1782174776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsvYFpY1yLMjl9k9WmpsHGOTFu8DXSJDXlRw/qNDPMg=;
        b=JeIRyBbyQ7wCTXZFvwiCgZHtkEgmytDGE5+ZYSTBZ9aGUN6MJHqWaNc0lUZKEIp71g
         WwFSQTXYEllxF0sddZMs0aNyimUsMcot59VFIgBXO6oIKHKrke3mkcOgwLPKzhaPdsHt
         lkTuTFeY+UJO8ItpwrSwub7ubPa23fuSTJaIyUHlDr9/+maCnNnaJS6p7r5c4geAt7S6
         3Kqei1/G6FHxF+vyr8Iu1ANmvh1WtiGZS/+hJveEoCMcY+hSDECHK5uSJ2809M+QXQVY
         QticJ+MTBSnJou7eiYseg+5ihUK30eApIYaeWLgTM8OXbZgXWCSWm5wx99KjtFYC8MMP
         UTJg==
X-Gm-Message-State: AOJu0YwvYpxP82+62eNPdBCS0KBM7CtFZSIroCpIwju+wlM+gkGNtLWX
	w6j/qlQ4K0ABBBYKaCTS5qPXnaULJCVLfvxMsbwt7UJbbQagr9SwycWouoR5eDUZdIHRQ94vTEY
	8A762h5pa1DEe8l3xP5WDyZjmIqu+ZlZ/iAXDCXvRmPOV4zyoLM+P8zL64QLO6s4SJFhoBR84RY
	3nPuk=
X-Gm-Gg: Acq92OHEZVRMb4q5iKBs/izWK6Kzm5Rq6aaah8mf4BoXdVI2y1xf7c5uM1e1aMTL0sd
	BsyCvrP3cDozjwDP7OHsXpJfb2FMEMBpKajorvY9fG2V/DygkeuXdztVSAVYx30qArplrZu/iS2
	KjQeV2v6s/vikIU49t/7KjD0+MXgofXOiWKQyIVzDxne0YPxEBxWp9dTgADlqeTm2U3LbtDe64D
	fy6hv/BGO4a8yXGq9cQh6INueulivoD80XEdtRJKxMH9PHNwPg3/55Dlyo1vkkV/V3x+H9Yuono
	EGIa+pjaNg3je/Bi/GB9f9L6H3WkI41I3g1nUF0R8Z6l1YFAu55svLSzwRaRXaRtxybWLvadWNI
	ZV+VAxlOMJSL2UrbkYEwb25P/Z23wI2ZwMXCC9jGOCzMrbtz0ar3Weu1GAGzLJ2J7fu6ciBGTBG
	pkYrdNssOzgb17Zevz5xn1X2tVacMVz4adwlI=
X-Received: by 2002:a05:620a:2406:10b0:911:1a2c:f953 with SMTP id af79cd13be357-9161bc5db30mr1804334185a.20.1781569975823;
        Mon, 15 Jun 2026 17:32:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2406:10b0:911:1a2c:f953 with SMTP id af79cd13be357-9161bc5db30mr1804331885a.20.1781569975358;
        Mon, 15 Jun 2026 17:32:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c19aa00sm2792491fa.33.2026.06.15.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:32:53 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:32:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 02/16] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Message-ID: <rn33vbqw3wyc55ynpq3d25o73uabmuh2ac3tjhznma37xsoiqa@pqmlzi6t54a2>
References: <20260616-iris-ar50lt-v5-2-583b42770b6a@oss.qualcomm.com>
 <20260616001733.5FC251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616001733.5FC251F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a3099b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xFi7dqVq-nUfgViKrN0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EzxoMhcaOpZ7vzFpB2JAjimbVJmpOFwa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX07VYYkg5iQeb
 k4mRri0DP1rsFuElvKREpxLOzj8Xrvd6eb4rHrz8P5pAgmORtfjP40TTUAgy/KOZpgwJC4pa5X+
 TEZtYI6TfWkD+b/J1xN6xYrK1cMnL8k=
X-Proofpoint-ORIG-GUID: EzxoMhcaOpZ7vzFpB2JAjimbVJmpOFwa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX/biBG3b29IV7
 dbLEZ1NtbzGxGxsGeh3S3okiTx0WmUw9BaNdeZaVG481LYxap+DaAdUVa4PgVqfFARp0WtaN1Iv
 cpoBL0YeRzNZj7uORKGsVAcXZKs8qxvgAbllYTeREfC9WIWbo0Js6cpu6CielVdGUem5DEe48K1
 MPTgf7vtvW5aKtpebLuAOf2ejwSBk0uV+GXkjg7vdePMhDxQVhnS2fIHxTrv9qCbrWqynAPUky0
 sF723C71Fa6Q19A4VRAfaaUbVHaBQQ3/NYZQPcU1ygQ/C6Qb0+RpgNvDdg8DHTHnbcoT0ooibox
 fepZwduxe2BnCZD+9JT1+vw0mdPPp9MKZpBMtkXkab803jPDGshB9i9pPtexyuz7wsUxLRE6B4z
 cok7ysapGmRsVTBRs2VI06lpfvWaWaj0srMPZxy6p6vZ7Ew+XwOMNb/mt9C4xPMj4MuApTEDA/8
 afGOXmAeBoD24tyBLVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002

On Tue, Jun 16, 2026 at 12:17:32AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `iris_vdec_formats_noubwc_cap` array contains a zero-initialized gap at index 1, which prematurely terminates V4L2 format enumeration and improperly validates 0 as a valid pixel format.

I will check later and respond or fix the issues.

> --
> 
> commit 1ff6b6e464175bc1ccf6878e0aa89ffec126608b
> Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
