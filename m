Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116D402444
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370416; cv=none; b=IFobgrKdQGiPrR3M5uG0UXeDzGw+tf27xG3Su+8aKuw8HFaXpBciar+9REbnOAqzFLKOfRe4d6miGdPrlRsBH1+D30mNmefpzEGezGBrcebIv/RmJG08gIGn+3ADjhNfF2v04i8z2XqnmTEX6hzWCfvgDBPRvUNRpBsoe01Y5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370416; c=relaxed/simple;
	bh=omTSRI5QDbAE48o5gj/pF9REcCIQsYOtUUvqIJycswY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHHyOb+QCDvYkp3+dXVhlnrKXexzFcC9KTSC1oxG7vVnXN0KUvbyy0v/nRQbnMq/NMfOJbbgKdMcRJ8/w11VlySYWqMYogIIzlIKEX7o/pZ8GSkHc9gHQX+Qyd52k7fsjmkopZbeB9iUXZd08IAFFMKH4X1Gezsy8/waDoXvXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1tjIUmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoTbVFnf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1tjIUmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoTbVFnf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99uJh3772914
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 13:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=; b=N1tjIUmdoMUeArtK
	wv16fhVTlZgeOgT64/QAU0TQmUtrNWAI7InzUUnlZegw71TxbGXHq7q7pcJAVJic
	K+uivRbB0JV3lwhVzgEMIVAhMpIHP/yc0ZxCdMlQyn5WxSRwNdA2jyGpTixiRF6i
	cFC4rqskn3u+LNMH/lA5F9W82UlvMVtOgzMoj7jJARaIWd6nCX4wZ7LrWIjVKmOF
	BEMuY7k6XugMo0me3LP4lZMIAdMH5lnMGkQFCeO8bNesQgQ2uMX894t8qxqXYUvW
	14kiG+bSmYr0GgzzS1+c18Xw3CWKjK7KFzuaXV9G3c29Tbsu4wR0GhUA56CM6No0
	9xSHBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43dmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 13:33:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba224c3ffdso148809355ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 06:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779370412; x=1779975212; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=;
        b=GoTbVFnfKHYdd2MI+5N/cdjlFusXQILO9w8KBzNbI2MMROEkgiOt7i+nOwE01KcV3X
         rCKTDb1XTgxtOnT7FCFzIIngwQa7nr6M3CAEjDRpnhQlK1eAKVCR33uY+r14z7MwvjwD
         RngSy6yf6zlMPB9wbBB02+6K1SGPhnnp7hpoNPQjRmJfYwedJ/tsBfgTCTXzUCsztXGp
         mMLtGNbmM/6pmBNMiCiL1eOJEdvPB+ttAzPWK8K2/dwS9MgyCGTFun00kygU8ym32QTH
         ghHY+e2cnhWaetwNId3eZWML4uf0xooTKiw6gLE8vMNZOJjeePUN09CzCMYGGB4fgIOx
         pu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370412; x=1779975212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IdH3GzdWYwa8Q9g94MkFFyBEguHq6S6gLpwxGL6T8Lk=;
        b=WYAXc9UrIPRlsv/f3PD8OxSPt2Q8ZzKQEHvFmQMxf4ADRJvi4jLDxL9KcyZHzZExmN
         WLBDQOH3zlNS28xOYs/C5191Na/RfoosfymvNcyDh6B/qj+1o16LM2ieKB84l2EQAR9w
         JUhZvz6DpTtbk7514QFmFLTeVaWh7F8BjMnhcFFL8o9MmU5ig2HDW/Dml8jmZwf3h+Ur
         BgKdl7bZAlcqyKMjqJzxoWbYrIOtzNGPVDwhiCBbFS3I95fXRGDsD2yHjTxjnhpjvieC
         M8PhfrHkV0tUP8JT+YFOHXTExbabH2aqOAWOqFc52eHVWwuQw9RI0Etw2nu64R/Im3va
         cEdQ==
X-Gm-Message-State: AOJu0Yx2P4qfjWe2s3HrAd7FiH0t8B+6WuL1aKDOJ7EitOpCWsHslxv0
	kSIxB2wrJAh3mS4f0u+ZqNJxnh65RniYPHNVWXpFL9Oe7vplCt9PMmzwZLUiMwKrWVfmoqtulo+
	3srKoJsEc8Mumrm/wX/DCXWjlyBRC1Y7JaZo3pSuhmRVR5poWYUIZQY1IA6v11TXb7CwLzwpjDV
	vvX6U=
X-Gm-Gg: Acq92OEJTmsBrgVDg4B0909POzkqC/6gM70w0grTAGrlaG3fgvHE1JGBmqT/OmYk1lX
	C21e1bZolwEj+uE7DZcdPkh+Xd15f7t/UxXqwTHcXHugJD+N7d5KQrSY3etOa5oO0Yxm588U1Li
	94IJpK/ag0R66agzqa3qm/rcgQru1q6LBDclfksD+LbGpPq0svcIkKoqtU5LXJvw5Oa7VcAmMil
	F/xGVTYjt7XdZgxlU8whc8wKCT2Gv1Bu0cgjF5c92n8vhtL+2wWXY3JDZorpXus52p/TkLhvuFz
	0CarpXLzEMYOaFhuJh/zJCB0vQO47GHbcvZFtHL1WxHFjVDiup+rGBMkw8SWVN0Ek22SbvyXvOg
	H4Z44h6IjVyd/WjrLqBT/DVnKaO+ziU2ZSQaPvoDBYBwerPoy
X-Received: by 2002:a17:902:da89:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2bea32d02c6mr33845115ad.5.1779370411827;
        Thu, 21 May 2026 06:33:31 -0700 (PDT)
X-Received: by 2002:a17:902:da89:b0:2ae:ce35:2686 with SMTP id d9443c01a7336-2bea32d02c6mr33844565ad.5.1779370411223;
        Thu, 21 May 2026 06:33:31 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9172520sm13349495ad.6.2026.05.21.06.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 06:33:30 -0700 (PDT)
Message-ID: <1712f500-d4a9-4387-947b-b02853484d21@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:03:26 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        neil.armstrong@linaro.org, vkoul@kernel.org
References: <20260519-shikra-dt-v2-1-c01b90fb4395@oss.qualcomm.com>
 <20260519113234.BA75FC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519113234.BA75FC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f09ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2bXR4lxtNcP_XfbIfakA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: m0-IjfPYVhgyvjIQnfXuxLp8PMaZjxqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzNiBTYWx0ZWRfX0g2HFbfK1t3a
 rTxhNU7CZTHuvHtfdSb8yTxY80y2Pc+NfhsMIV3fBmdhf4l1ltDKSbhcI4aGANcrMwtg7IMrlJS
 JBtVT/YByclFTpZiCPcsJTT6uDz9jKYxC6MCqEOfxd7jNtPyEY2BY1SOovRY3XvFqYueGr8YYP8
 ywdopLUwqH4ShcwGSJk8M/73WWrdeyhkmm/0cryIxmrI++wvDvsB/1VeEj6P3/hJUrdvOVShDkH
 C2OLR5HIUKAFeRJRiruAZ+NedcTSHLfX+lfKwLzBw80+UtCt56tXuwYEAY4o5LSvCBcXp6iPtLl
 v01pU0X/X/1UXdal+gqYJJiD1xRKEP5rDLHE9d5y1shM1zoGRqt0T78KUZiRJHPulav3JLj93ID
 TZC25lcwqtOivdQXWceIuv21es+ax1Q+t3OeAr++WYaIOESmametulTkf9UNr+Zbvlk2tMf6v/Y
 degQ6aSATu66urMSP8g==
X-Proofpoint-ORIG-GUID: m0-IjfPYVhgyvjIQnfXuxLp8PMaZjxqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210136

On 5/19/2026 5:02 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Device tree compatible strings use generic abbreviations instead of specific hardware part numbers.
> - [Low] Alphabetical sorting violation in qcom.yaml.
> --
>
> commit d5de85f1dcdd73430dd4bed54ebebe0837ba7f5e
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: arm: qcom: Document Shikra and its EVK boards
>
> This commit introduces compatible strings for the Qualcomm Shikra SoC in
> System-on-Module (SoM) form factors and their corresponding EVK carrier
> boards.
>
>>      Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and its
>>      corresponding EVK boards.
> Should these compatible strings use the specific hardware part numbers
> (CQ2390M, CQ2390S, IQ2390S) instead of generic abbreviations like
> qcom,shikra-cqm-som?
>
> If the generic abbreviations are kept, can the schema map these
> abbreviations to the specific part numbers to document the ABI?

SoC number 2390 corresponds to Shikra, so using shikra-cqm-som style 
compatibles looks appropriate. Same applies to shikra-cqs-som and 
shikra-iqs-som.

>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index af266d584fae6..7c5c5f4fc30f7 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -968,6 +968,24 @@ properties:
>>             - const: qcom,qcs9100
>>             - const: qcom,sa8775p
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,shikra-cqm-evk
>> +          - const: qcom,shikra-cqm-som
>> +          - const: qcom,shikra
> This isn't a bug, but should these new blocks be sorted alphabetically
> based on the root SoC compatible string?
>
> Since 'h' comes after 'd', could qcom,shikra be placed after qcom,sdm845
> instead of after qcom,sa8775p?

Yeah, I missed it, will correct in next series.

Thanks
Komal
>

