Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E141F3BA4
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673232; cv=none; b=ZbcFUlbFYNNxNpLhtuLKjFvclhVpxup7fc7n3v4ESm0RHDJ2WHAydJLulKujqkEj0aynzMZJawgbQZTa8PVLPk4TP/ERpiHnIXXoxPAM+WhjD1k9I3kWycttoZxjXvOpJxaM3hqfsvLOgoZJWmP8XePnq2L7YZxYdY3coUvP03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673232; c=relaxed/simple;
	bh=yBxEQZUUobhXdaCeSjmCcAYNRxEpPRGyOHWh/pfWeDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5ZcyFf/26MyssZwXQ3E9DiC7LCHgP0Z6Ue9UiUG0AolNFOTbYFO56R63w0E1KxDiqJF2eTzIqJ6gq0hV3xAJ/D3xpuSAb6cM0U23oPC1PfBiiAbHtrWKUhdPV6l2qG5p07Lc16T030XJUdhrsFfX7GcFLqN8rAynz+MhSxaW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Flp5xZsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iibnsPkQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Flp5xZsc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iibnsPkQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6f1G936372
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 12:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=; b=Flp5xZsc+ySsXIdw
	G6Z2BPQ+u21aheVOli+fWEa021eGcn3MHdt+05v6Ctl5o1xKo/iD8ueotsI/f0+c
	R7i71h9iTjWpfKswvwpltrXAIFV3/+HvoOnPYE+YB+3qdP7D4+WMh3kwILdfHl9c
	StswbWZTpHqetqW7SVVvnVcj1rLgh6W+O0+hE1VWGoi1tc51sszrAanb0yQgr+Uy
	7lw+OUHiXF1dozsYQzhvV19CQR/+qwWOx5DCUNXue4Cw3U4coxLCSiuuH5tNcsU6
	lgxfzFIEXvT3JK5sT93oNO3KlzF7TA5AOKf10xaX0if1Ya9PW2ewopU5QXNvoVXl
	NoOvBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygjknw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 12:20:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso249331785a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785673229; x=1786278029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=;
        b=iibnsPkQ9J1vJLDHzHXD5Ig4mZhVW6WjYuHtcQKZMNT1PVesww/Xxb36EnpziH+smm
         9aXa0g7fU098LYVgLdsk6F6YKpAKg8ED0m+M/gypB50z2odR74T8wEMBnPN483p5XvoF
         qD/XX6enLn1CN0jltygzv9Xxil0d2WtUN5qlR8Z5Lh/WwHK7/u3hPrphlLwoTdFwV6Io
         Fhuk2uP9ywKHdEr2AztLfpfkwfu2tNqBKhgtqlsdrM71yuTSIs4utNP1MUf3o/wjnBLw
         VnTgjrS+ZCxx99ac8i03dcP1F0Ny6lLBt6PxeNrVamfRljEiSv3jQW2mzJgwx44AiAoo
         lYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673229; x=1786278029;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqVHXrcwuu95Z9fohd/vFiT/4PJIJ1W4uuigeft7fxI=;
        b=qcbasMpS9MR+VRgm2PKRYeECKHwJFG0icH+vdFNZ0EqPWBZtZiKDCvtMu3zzhkHJyO
         vYHP1sFGcGAdE8k7zrnF5MOKe2359DRn2cg0vEC15pt3rqXDfLDR1TfWbYOwHmUMP8VO
         5Atj+BPCf0wxLXkKyWD6oIH23CXdBRkkEn+QFLBQHVFSEdWsuC4xy8dj53kKGz0Oh5bI
         dHtK425OPBTAQXGtDcGrmFLx5vYQoekHUpFjncGkGhkwWaPvlnBy8CFytHrZ+1R2spZ9
         PsEPym73BKDLaxrwXq0eiyE2XIr1PLAphvSFKCsXbbUxx0rfabQ3IuAEVRRbnyPjSUll
         I7zw==
X-Gm-Message-State: AOJu0Yy5FBF6HJvVGI+H+DKR8x8T5qqmywpncp5OeI0ira6mTxdywi+Z
	o4gJYNc+AV3qm2Ur1ED325UlBMoiPEt0WxoNJyEfRA4nvxGLd72r6cBEk6w/5wjUJ+XccYYKul7
	6dOZMR0+wFw+MfUyLgHTQH5zPdFA5Ckjp2XSlgLnbC5RUgaOGuRZEsjlnG44MUYgocSTSGI34Nv
	CNZmY=
X-Gm-Gg: AR+sD10vIfXNagsy7+SSELshfZXm2Z4sx9Zq8x5ad19WhJlg2QNSs4Gx/AXTB6Lql+e
	PQ3UWvldbUYouvsy4kskrHXJMwp0k/TdxFgGzHinBMSksLlhM4N/qeUBbvoamGFHJYfbgc3W2ck
	VrA6bC+2YIAmfIofcW97E5Xmjb/KxXQbYFgVma0aRgDZYqHBF3H8YWU0FkUjgzpzvOJSN27+SNN
	M9Vv2TF5oycvh94S/jGADmp3kqVRLHWXYKMAAa+MUIS1kS5I5QXIB3TJ8zmHdcXEKtTyhpxTz9U
	IdOXUj2Ha0s1nWnJ8zz3CJUwEc7rAYWe8ehH2WkpaV72QtHwOnq690imI+xnaPvVTVRr8xLkwWX
	T99mahc8R5uv/0io/GVAaCvWdKHDIsw==
X-Received: by 2002:a05:622a:4c05:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52b566bf44amr134623281cf.10.1785673228723;
        Sun, 02 Aug 2026 05:20:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52b566bf44amr134622931cf.10.1785673228341;
        Sun, 02 Aug 2026 05:20:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b4d8absm62082785e9.0.2026.08.02.05.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:20:27 -0700 (PDT)
Message-ID: <e15eadba-b1b2-4293-9200-5ee8d2c4230d@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:20:25 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802-n-dts-style-checker-continued-v2-6-6c5dbd1ccfe4@oss.qualcomm.com>
 <20260802085617.BDD711F00AC4@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802085617.BDD711F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEwNyBTYWx0ZWRfXzHfibsjsR3Lc
 By8+iIvT+zhW7LVs3vdu3cK+yJ/tvjo4hCseVUqP77/hGvYUHSRyf42jqqNmmdVUUnDUY9BSpDD
 o02CU1BncmkEMsesvqMUb4foYN6tc3Y=
X-Proofpoint-GUID: jrliseRrJ0ddZdH6zGg3CvF1-b-Iq92-
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6f360d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YGTj8SeafjBK6mebBwgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jrliseRrJ0ddZdH6zGg3CvF1-b-Iq92-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEwNyBTYWx0ZWRfX81WhoTpq6Caz
 RVvkYZPzu4Vgjy+tmLDG2/nZJDqtuOl+aCr0Mxdv21b0qEtRZ7/FOicjgoev24bu82ZA/iIKqx0
 ZuFHDO4RPv01QsID4pfdG6AuAXexTDQErUAogCfB+6E+zCQrkm0nQykKYn+6VP07ZTaXARxYFC+
 MD6dCzDDN1X/a/DzcFojayP1lahc0+0iinUqwpPuqX69/aj6jzGbywjsai+6bCi3RCn4p60phxi
 iumfcvi0X9zr+hvTFbcSMigs2D8csXIfFgJqOOIHttFDlwDgcWFLmgAaUyab6P7n6DGKaLZLXyO
 HOW5df5uAKgwC10ktGvwCuJPlGFcUAePtfuAyk+bn5pSge7tnqtFMTVAIGMCaA4W3qrDOjeDGG/
 UROZVhdYeUPhAOcGDxB3vpnvLCq2iCcBRVMzXt9VgIBTs0Db6OXBn8/p/PknaWqncV138NxzkqK
 3bNSPailhKYhsbDzF0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020107

On 02/08/2026 10:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Continuation alignment check incorrectly treats valid top-level elements like closing brackets (`>`) and array openers (`[` or `/bits/`) as inner values, causing false positives on properly aligned device tree code.
> --
> 
> --- Patch [6]: [PATCH v2 06/11] dtc: dt-check-style: Fix alignment of values in continued property lines ---
> commit de051474019f5f4a78cb7dedef4cd8e6a02500cf
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> This commit updates the device tree style checker to enforce different
> alignments for property continuations depending on whether the continuation
> starts a new phandle or continues an existing inner value.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 04247e39a78e3..cb3cdfda5e739 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
>>              continue
>>          # First '<' or '"' after '='
>>          rest = dl.raw[eq + 1:]
>> -        m = re.search(r'[<"]', rest)
>> +        m = re.search(r'\s*([<"])', rest)
>>          if not m:
>>              continue
>> -        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
>> +        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
>>          for cont in dl.continuations:
>> -            if _display_col(cont.indent_str) != target_col:
>> +            target_offset = 0
>> +            err_msg_explanation = 'to < or "'
>> +            if not re.match(r'[<"]', cont.stripped):
>> +                target_offset = 1
>> +                err_msg_explanation = 'to the value under <'
> 
> [Severity: Medium]
> If a multi-line property continuation begins with characters like >, [,
> or / instead of < or ", this logic applies target_offset = 1.
> 
> This seems to force closing brackets and array openers to indent to the inner
> value rather than aligning with the opening bracket, which could produce
> false-positive linting errors on valid device tree formatting.
> 
> Does this regex incorrectly treat top-level structural characters as inner
> values?

Well, maybe, too complex to implement now...

> 
>> diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
>> index 36fb4eefcd83b..1a1c07c09a415 100644
>> --- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
>> +++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
> 
> [ ... ]
> 
>> @@ -18,9 +18,12 @@ interrupt-controller@10000 {
>>  		interrupts = <1 2 3>,
>>  			     <4 5 6>,
>>  			     <7 8 9>;
>> -		pinmux = <
>> -			 0x01
>> -			 0x02
>> -			 >;
>> +		pinmux = <0x01
>> +			  0x02>,
>> +			 <0x03
>> +			  0x04>;
> 
> [Severity: Medium]
> Since > isn't matched by the [<"] pattern in check_continuation_alignment,
> it seems the tool might now incorrectly flag properly aligned closing brackets
> as a style violation if they are on a continuation line.
> 
> Was this previously passing test case removed because the new regex fails on
> the standalone > character?

False positive

Best regards,
Krzysztof
