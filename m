Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C33CCA19
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317001; cv=none; b=Cl2jG+Pb51QTgPnHUHI7E4/voNtIc973zJeq+T30f3FhHDz6aKU8kOPLMtsgZF/zH7Wz1weQ0CW/UQ+0MAKHBtsoeYPDZtIxRH40xWkZmcFjmXYix+X/7ftcFhnE565EDZbPh9kRoUJ983Z8vWrE7+bwc/vpLWtmJ47Q4M+EEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317001; c=relaxed/simple;
	bh=MbxqdPNcJm0Aj5xet1GJUaPO3YoQ0EAZte5YPmJbO24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLf4qpFYpaqoRarSs3NaV0S0cpDNdzmNs4LffCXBGe9JfhR8XXJkXYOxSgEVkIqs9EqHgDJ4/tZrrZRFBcRnDrOOAr9s/farDulAD1Q8Wdux8mtbQHi6JhmOfngiHmr394JtmdZ3cULl2w95sZlujxyDtTh4ux2s9BYMEshYipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp/mw41N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMM2y3sM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp/mw41N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMM2y3sM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVFO3736793
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=; b=Tp/mw41Nlkg359fT
	773uwT4Y4nIBP0rs6V48GSxCBbJamAulvRFsyYd6/dUk0vBrK/BdAN8TO1SV6dUE
	AxgkK1PFZcd8YBT1K3TfIQBkuIN8HBE2sRI6SCR4nErcYFDvzJ5n9E5CTMPYrLTW
	SBQkYK3pxMnCUNnjV9KpOTd2H3okGaJtrjk8EuffDiMaaqngUqW242xGxZOdsfc+
	xaLe5sR9T2ebUt+HA8/4YBOc0hvfYZ8K125gHCA6IiXUQwJDyZEpBsfdb/Ftdh7n
	OU7ZX741JijaZ1nAjgTgB9Th3qAvWjEpcQSsnTUeCqOyTxe6/U/ueM18TmU799GI
	XSn/+g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e2xun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:16:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so387105eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 23:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316999; x=1790921799; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=;
        b=HMM2y3sM4L3lu8HwsVhiS7SsYoNfEYP7Rt8ZYiqJlJRNBw2ICyMF1OG4KmHZCFouv/
         22ske7feJ+B4yphM/EGrcedoVjO91psc+jIS6AZMadSWvaQL1Uqj6X9hUv601wSE+tOv
         W7pwoo++wmgo6Btjvq8xdHEtRzIX2cMtKLtVx4iJJ/GC2lIoAqqTEldmYHsgq1/FCPWw
         U9kEjxK3G+A3G1XlRdBJzDWTKBC3VwD98D8+4DWJM6X0dEoiR7KLt5TUlVjrOHBRg4bp
         7RHONbt9Uq5oeDu4/mbO6y8odb9XYimgnTMcf709YC0z36xNkAH1/oWe9dMwEvgA5XB1
         CdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316999; x=1790921799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V2UPAVQF53aIGT+lae1TtiaGVGpbVGhbzFnIsJsyc4=;
        b=H6nYPjTOS3JOkvak9Hs3omHZKGqAYgrWYb557HkZI4Ab+ToirizQ1Ii3mK4a6QsaXl
         fDlbyVNCk05ZM3pLsb9I7B1QT84a0PLDYp3B3bHW0G7g2D4KiurMqXvMyyxh93DcEnk2
         JUgVsqkmT72m+v1KEhADTHNnT3GUfCXNhLVMSnAhfg2x3JJkX3sJW0KERQPJtab7Jn/b
         ZKwT3n0LAq9Wwmkar6W1VjgL2rN8v2axsb1SPIL1lz1IfAMYUHnelBZF7XQLq620uw5l
         uQeUw4CmTe7ePSwFXAg3UTOM1SEQhztQvBSW5NkL4jBXtL5tmX9abAInHHlxRBVV5smp
         jMZw==
X-Gm-Message-State: AFuF++k4Fv7IgoL92dT1CnfcTKhCw/vtj5BvE6Q5S8SyVOMEbrGLQ0Sr
	0yIs3TTDh4M1rIfEM1sFxCnzWjuhxO7s3pfz32lIiwCCUQ2O4DVXHly58u7YB8SXSLMwcSfl7YW
	VQ9Z/AuMSl2rdEqqEiA2WNl97vYu4Igs9ulKZ3EdCMEXoapXEJhkU5nm4DL37NrnrHwvIq0hibP
	ZiD6U=
X-Gm-Gg: AYBFou2K2Ag7E52I2RHqQS1rHRwFZL4LHkRlgq66nivrRU+P7LzRnDknONAoVKtwelO
	mhYACSjorCUGk5VdaiULr4w+e/sqgn7H//9JqrMpbehhHZlnOxj51cQ2/aLESErGwCcc5Ev+R2e
	mnEtLrb2eMkTFujG6X0e9Dw31qFtrHXW0sA+UoaDxDp3WJpZc5g7t3mCWa4A7P61D4/UaOE+BS/
	qbZGpPKxYzJuu/cBQoiYnXQXhqTPRMrQeT1H4PosFUDDV4/rRcTD8peC7e7daQ/RmGYH8qfmlDl
	lngI8vwkieaUWExYs3RCP9tt8QLx1AgSL3jW0JCGc3deRy3btk43kwIWxMkcQY1rc0HF1EM9vq9
	824/Jyw4oGifZEgC6TaGkshEJJ04=
X-Received: by 2002:a05:7300:a7c1:b0:341:4553:a529 with SMTP id 5a478bee46e88-34199433ebdmr956256eec.20.1790316998504;
        Thu, 24 Sep 2026 23:16:38 -0700 (PDT)
X-Received: by 2002:a05:7300:a7c1:b0:341:4553:a529 with SMTP id 5a478bee46e88-34199433ebdmr956219eec.20.1790316997704;
        Thu, 24 Sep 2026 23:16:37 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144e4a6b9sm3264979eec.18.2026.09.24.23.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 23:16:37 -0700 (PDT)
Message-ID: <61eda17e-8c21-4629-9aca-a3d93da3cde2@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:46:32 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
        media-ci@linuxtv.org, vkoul@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
 <20260925060140.154E21F000FF@smtp.kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260925060140.154E21F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX46SPVLw9IWiI
 fbgAfQ+oVy79l+aVxQhQrz25d+D6aqXykY1ko0GWvq9PYYqPBiezSj1W2J/oCmwLb6MGHyYzeHV
 3yNfUoweQiJj3uLSsOCrd/PTzNiOWbxwGGLn0ES7+OzdYvhAyGo05LPImjCrtxx+iCBASBykqlh
 NGLwVfqKhzz9zGCOJuSjxyq2nAABX6KjWk+qe5rdv3XofubtVNUnYQ9cZ2KeVwc5qZgBrjToNvp
 lGMHL6EEz6djPg5y0tGrr2xfulaCbMVP1tvtwGZGXY9cEM1Oy4UQwUm9cvlXTWG/Ur6zFehv+oU
 a00Oqyun8iXFg9KxOlzsenzIVqOkfCm0E2qLd0FEN5Nb/epiar6INIbNas7Y9Y+2asO+K3kkJjb
 QPjlMj5XZCX+yPVKcejaW2EQ+cHM1YHagsYWPYB2iiZEBmkyOBy0nrierW1LkPWnO4UGzymH0Y3
 h/vsG5XTAn48qeKoDZA==
X-Proofpoint-GUID: u_K6GC5p3BinHtWalXraDVl-B2EAn29D
X-Proofpoint-ORIG-GUID: u_K6GC5p3BinHtWalXraDVl-B2EAn29D
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab611c7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=GpX4wC2T2iRaT2CMI0cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfXzxZ9ox6N6am9
 o2PCkxDjiYIPHMD8m5gnDJiX9ePIckXOzUd1Mh5iKdjJLhoQApbD30Hrzc1EoKM60rtHrtihJMw
 HOmXKp/dl5lo6P5NNibc1lmdb56XQWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024



On 25-09-2026 11:31, sashiko-bot@kernel.org wrote:
> Does this hardcoded resource mapping cause the probe to fail on Glymur hardware?
> 
> The commit message notes that Glymur only has three CSIPHY instances,
> while X1E80100 has four. Because x1e80100_resources specifies 4 CSIPHY
> instances, camss_probe() -> camss_init_subdevices() will unconditionally
> execute its initialization loop 4 times:

This is addressed in below driver patches 5 and 6 and can be picked separately:
https://lore.kernel.org/all/20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org/

---
Regards,
Nihal Kumar Gupta
