Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C983DB32E
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453847; cv=none; b=rW9oH7aZQ31pbOLEPghL0iAMAvw3ZDootl4p+qS8D05jsnicKelWib38g7JOp8IPpU+w1ONoDVEgtB1Vb02qEEhOFa3xPlzyIVCGKEXNluUnC/Xy3e4GFSK4/NROLgtHZlaRGxoNozVWG+lR/qpQtfm1e9fzthN/oq53FCciKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453847; c=relaxed/simple;
	bh=fA5ZuEivaj3K5Rum+AF/pxqLAH4XMn9DI+2PxXkybeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euFIgzA+cNI0/I+4dbbxL+dRebTMOmD3D3aiNdHXo0pu0RANWrSgJqrBYiAFCmycPlSPqwML84AbkSWAz/swV4IAhjPgz253/X3EA2xLlGGIM+wburEa9SgldO499aXUKHHMX3ZVX1eLV/ZkWVG5Gkquy0am2+NW8Hl1IFFafsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKqMSQBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAfGMNj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKqMSQBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAfGMNj4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrjHR2353062
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/DpREDsoQc4H9dZ6Af9qMzVe
	qSt8mdr4OUynNzksey4=; b=KKqMSQBRFmhgTw5Nmbo2gIaUIdt+tHGYMYX40vQ1
	zq7RGP8PkTKkjxYMSZaDF+v0b/OwFYTnJ/3cGzrJJYjzE5IbNUoB/udohPyHZH+T
	gwxgJPpMQBzVMbAiKWfJxD7XxgOWKoHGmjNCEwSQYLT5pDvLJvtxDYLyvmooqX+Q
	I6prNmrFX/CZ360wQZOVGo9wws/ZQgCwWIDkWCV9lwAc5ah0K3FuP5FaBlnBI8nm
	6KcmF6lwrCEBrqipi5H3av9+q+EtMgdmmwWVd7XSCopQotuu7juA/cLZ4i8OLxK1
	02L/Lld5uAww72okpK1BSb/7v/tOuIzDFdbKLKJLxIdQUg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfn0r341-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:24:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90410c668adso4814766d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785453844; x=1786058644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DpREDsoQc4H9dZ6Af9qMzVeqSt8mdr4OUynNzksey4=;
        b=bAfGMNj4yk1DwDzWULFSDEixX9RBzRZPmqyXatG6fda0oLdl+M7ZxvhlC5ZOV8DjGb
         qaguy0WcZeKeYPPreNcMwWs9RIAAT/Ns6mTroKElaEbdPeT2FF012xLZVowteue+P/HB
         QbDAHBtZrDUCohL9NuTxj9owkrOTmanoi+vTtSu8pH/Lk0nQjKRDUqE+UMbmYpUzRkd6
         MbdivunxAu3gmmLgof2iDQ6FV3nz3/Spx6Df34bkq7eb2If9jcouH3EARgujG7fVp2sL
         UMGa2DxFUvR6tNy2F5FQa/SOqS5Q6MFglgn4OD0ESt2CIkLM5t8QoTGi5wh7R+7dxNWA
         7Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453844; x=1786058644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DpREDsoQc4H9dZ6Af9qMzVeqSt8mdr4OUynNzksey4=;
        b=IAhGVL3APuUjfMkdFPBteeJm0SiZw2CEJWCeJzrPiWz2zt2+SCMv3qqOFWxszjIr7b
         bxgqu7b1J0NHcOuWe0xfsHmucBql0WLaNcxfUpcYsWdddYKdaE/kA+otigCqbvGHUp93
         QelhQztmSt2XL4HuTszz58QFTb6i41NO+7Ym7xIkeWVnkvVE3NusQnSg6goKMQn+wiCE
         TR+9DtQTz582N8ABtMk2zvAub+eOeHrro6IHAbap+7sPpJnzaN/kvl9aLAKzORCJdmvf
         r4vIiQfhfhy8B5w3MIRTAXMWIocs+zx7By+pUoD68/f4g9Wou2ioGeYjhyd71t+EmUvT
         OheQ==
X-Gm-Message-State: AOJu0Yx7Cn//JRsHIFJFu15Y+IWbXKQ3qhwfT69gKXacKDvSE/UaoDsx
	6bmy/GqVjoBSpxEJoHgYcZqNycR9jdCA6QoRzo4YJizOAd0ZDoJ8bqPa7syiT9wSFrvQxdj6AOW
	POBejarkfidkh6ETYRVCVJft1Wp09KgexwaipjbqtD5qdDO5k4/zLRrpR3p2r9ikZn+fNBwlDhs
	lHrj0=
X-Gm-Gg: AR+sD13HuxBu9w/XAkWX+P00dU7Vgxk/k2jJfE24rmujhmC6HxURR9vHUXYgm5pVbFj
	PUyhNd9rnr0mX8DSv10VZPqiR5/L4IUoM35PldJvHPoUUr6v5WA378dKHBk3c4yB9nA/a3p/6eP
	6sU6EBMUmrUm95DxFHv10qaNY3luoJUOyuUOCKOc+WtcG9ELD/woRX4dBJqyGVJH26M9gUbXio8
	j8NJjVVXfsU7gNFnSQE7E6HS+2i/Dmzv4YKw8b3Wnr7iVlAKrNLMC7ZVvLc7AOp2VHSL+OkoMuO
	uCkG0aClI6wPu/1GjG30MYameYrWuC7jYdhf7RGD8N0H0yJ/ZBz1iDVFmbhhCq9IC7Aqy3MmFJq
	An4BdnsMouqDWS2p3g6NyUzvF+QxbcmdRaaWI3UAezSCNd04GqUQjW1hjt9hEYL0xX8sTIJwEEc
	4Q/1zYBbjyy95Pjw==
X-Received: by 2002:a05:622a:c8:b0:527:7891:1713 with SMTP id d75a77b69052e-52b42ba2eb3mr25000131cf.39.1785453844268;
        Thu, 30 Jul 2026 16:24:04 -0700 (PDT)
X-Received: by 2002:a05:622a:c8:b0:527:7891:1713 with SMTP id d75a77b69052e-52b42ba2eb3mr24999841cf.39.1785453843699;
        Thu, 30 Jul 2026 16:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9baa0dsm635149e87.54.2026.07.30.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:24:02 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:24:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v8 02/18] media: iris: Skip UBWC configuration when not
 supported
Message-ID: <d6wuqm4e2gxldrrloqxfxxmfggexxsjvltl25mgorrvhqfnheg@4cx5u5f6sxut>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
 <20260730153236.773A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730153236.773A01F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX1g5FrX6ZoMn7
 DwvvC4khzJsEb5qX3eyUQLfaylEcU+NNu1VXTLKk9JbZkzKIaP17HEK0eTo5Lt7xJUQwsvR/AMt
 K+I2WlcbHy7f6RLQ/7R5ANgKeDrZSnlAtepK2ecW/lv/y+Vk0XcawqiLi8wYxTH+687otEudWz6
 6WVNyQ7fSMRhPW+0QW2t7+os0mXVxJBxWIgrgxbf0HU9BZODW2kxQXO2erQkjFUQp1YRQtByoI1
 sV1iQ4aIOtjM4zN5Kfuv5KCmz+DL6d5UVJWYkSWmgc8l/w3tV/cOr+/UQIkkPMD5KewW6CZFQcG
 +lja4+Ybh9s1OwcaL0A6UQOWBQYSIqeRIL4anO7vLabmDuU9M5Ig2wpLGoBZ8sTw6LUrjUMu7kJ
 kpVHQiLbrWiWwefLEdcRJe9sGu4zuTuVG6ARHZhhg1EDRf/3l57zGprmeaqmDgItILY+ZZbGkFG
 g8htX98yEbrS7vgSMow==
X-Proofpoint-GUID: lMpTF6cdZWWOEDgtMv__e6YxmlPGTm0x
X-Authority-Analysis: v=2.4 cv=fszsol4f c=1 sm=1 tr=0 ts=6a6bdd14 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=0WTZDXMykMspNyP2LdkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: lMpTF6cdZWWOEDgtMv__e6YxmlPGTm0x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX7gCjlRfOx5ag
 iH+Yy00uF3wg7s8xZtB73F5gGe/0EqqyfuH1SRZmqkam/tfn0lt5e0LNNSfvROwz3KSrKc/hAEO
 CDYFMcw50X5PgWLc9AMQfBvjRj2p+1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300166

On Thu, Jul 30, 2026 at 03:32:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] UBWC system initialization is skipped on unsupported platforms, but UBWC V4L2 pixel formats are still unconditionally exposed and accepted, leading to invalid session configurations.
> --

NO, it doesn't. vdec.c and venc.c filter out UBWC formats.


-- 
With best wishes
Dmitry
