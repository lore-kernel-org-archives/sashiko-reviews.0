Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582582737F8
	for <sashiko-reviews@lists.linux.dev>; Sun,  2 Aug 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785658948; cv=none; b=G4WChvZjIGTAVGEel6fVyjiSHmZ9S8XPXbiYZfC3iOzgRkqElQym/O974R06qrbyNTc+EzrR5+QFns6gfD6WrqITaW9l/UjA9m7s9iZZKl0zmU+KOLeak0W5uCO4KgvcYhIOuTDaN8YkgNbCIR8yBak3tQSD4s7puMvn77Nae1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785658948; c=relaxed/simple;
	bh=cnJ9LZfb8FmOra/boiI5kqLmXzZxbeSjElqbSgD4FqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiTcRXHW2E7AW12D9ML7+Pwjq7/7q2alMuxyEgNQVWfZgajomfG9lfe5+ZILYHWphxuYsAu3HaafzDrtKXntmxDfOok8FVjuXikdPWD57TtRVRJNbhHY3mzHrDL9/HFcBSDAC/uU1w1cWlhU7E+j3A54X8hwgdx9AXTSwvrDSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcUlmz4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fmZvkY7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcUlmz4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fmZvkY7C"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727mmdW1603650
	for <sashiko-reviews@lists.linux.dev>; Sun, 2 Aug 2026 08:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=; b=lcUlmz4SA/RM7Hq4
	/SnHnCcNpY1YHUMN1hpYkucv/1p+urie58L66k7kF+O5Gk5udiU8EIpQwGBjV2AR
	ZS7tzhWiwvTxhAG+m+2QyS4djCeZJxOoBfLzrw6squ5kmST8qwPgkvNC0wnrPd8M
	TrgkhDNPqa4PIAb5pqZbTZpfaUoN88Rsx2nvvfYIuVZ/yGkkrubhDYdQlH74yhc2
	svJ4rEUHCILgZN18Nd2rzKGyh2QK5XPe7Gr88y2l0PmfCn5WyXEKYEnt93Mi8lvT
	tYJATFU+nBAPy6RQvm+bcJfGt1HLWRT2p1IYLyt1MlDJGOE9GVwaK4dzUIz5nS25
	5XJJDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptfh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 08:22:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso37409601cf.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785658945; x=1786263745; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=;
        b=fmZvkY7CdJxD6ZOaMEGlHSZ4pPwoJOWyDBa0by7It7Th7oOxeJvLOhHKX+twfKR7oR
         nyZe4vdAhCVWIqLcLvwVDuSQLpWEX6mHvOChrifZDZIkApezS3zk1zGCK4GcH6dss93f
         qmUvZERfHEYyxbuAGRFkzSzuCSV+JkaGQT8PmqqiZONlSWAAgvOIa3lks3exL/+xZbHQ
         sBXO/fFV5cVzh6FADZcRGySPqNl9ee+JmUZJ5o3Rposm8ZLer8bOuNEqyzyXjZ+PLOqT
         hPXhHSt9zqQiIyHTu9sCtYTYOMjgWtbbTksAp3JOcOhvS8i/Pf3lP77ps28/8cL5tHyu
         kF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785658945; x=1786263745;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy5c54Ws3qiep/orrNmhOL0YpuXwaWYyCy6oSaQSYII=;
        b=XE8LAH9K1o6hxA+9F9XkdaotTbdDyTCl3UxN0ozOrdO16eZhhfSgvCFxHRLK5VGVVE
         63V3Rh0F2JDK6t1jhtUv+7hDJmwVtWKM5eWEcdNUOZ4NeT5KhVmUw4s/xKYX+WokVDBP
         N9j3smLWxNo/fk1ev+ySP6SuUjYtLZgjScYJdw0muFE4//k9IV9mDHihiNzlOw53jSjX
         zUSdTawkpaypilv4u67kbqPJSCR+9SHyNtwO+F44fBPQPNb27IYMiikwjqRzyiAgbM6J
         KGelah16eSfJOIdnY4UTGI3VDYLax4lpNvJ/cC8Ru0SJS2jrYCSGqfODH3FIJRBkVQYt
         6P8w==
X-Gm-Message-State: AOJu0YzDUWGG9IaQlNNEXgBa7xwc3FXbv4SamNHkSXyhPA/OBTlVDvvC
	COjNVaUV7bPSefgUdp0ERW/o2HlEiiwfYh6H/T8ARhz/3A3oUNkpYuf13aBJdecfjiOa8dhQV6/
	w/5xv9+7JeLA3aOOGZYA5+05wRHo2H318EnhJLQbpoULvFqsSmo2ji4n4M+r5KWdFKo6uEeP/qH
	gV1ns=
X-Gm-Gg: AR+sD112yEyly9dIxFZ1BIjyuWOtYJFHDrasAOyMIVRRlXCwcLnLP56JfqCevya9UZ2
	Mjls1c1pNORF2drDi99R4AYVELYYuNnqCs59/IuflKehfExbyho5JhgETOMdp37sPu2oZ2BwQJf
	4VhWAqxzgfXZkTSas8ZHCr0AyimX1i5lxm585IxTLy7qIpm7LDf++FOEOjCqDizztt4o58CughN
	v/frxMgisMtbXiNpy2Ih/S5JRWZK0I+U4FIIJLpI23MSWxDn/e074xJLhGqzDCIX5/AumgbW1yx
	hFbNCrMto0MMMEz0Ewnd/Ws8kp5quSBzysYZOhQNO3jgrz4L3Fcn87SRLIsqJGCqEk4bwIDAHB5
	yrpG+WwNuwZ+UVkB0d3kdKqvk5A0pKQ==
X-Received: by 2002:a05:622a:5816:b0:51a:329:e802 with SMTP id d75a77b69052e-52b567d3c6emr120252351cf.41.1785658945226;
        Sun, 02 Aug 2026 01:22:25 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51a:329:e802 with SMTP id d75a77b69052e-52b567d3c6emr120252151cf.41.1785658944740;
        Sun, 02 Aug 2026 01:22:24 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1756sm21343657f8f.4.2026.08.02.01.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:22:23 -0700 (PDT)
Message-ID: <03e6c777-8afe-4d8a-8267-bc5bc60fefbf@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 10:22:21 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-6-b05b8f897670@oss.qualcomm.com>
 <20260726155645.81CEF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155645.81CEF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA2OCBTYWx0ZWRfX9b6oSAyuv2Mj
 NabovoYlnmpuMSW6d1FNuFtyYkEb/NhnQMz6p4DUUSFySZDE1Z12Es1cEtFh+PUzrTjXysCVmXk
 gqYBWItmVgus54qjGX9BhIxqlpGqUYqRQSe5LlUX1269m1h989EzkmF2b1Nux7WgrmDXjhLwwAf
 zwahjpQp6s+XrSNsFMSGlv7+6PkJI6wepFB+rcUGjFuCRzQN+5zaaJ5HQwNM0Eg5IL+jy1U8xv2
 Ft8i1fO8hfleVF3j1WMrlDr9gu8yiq9soCSsMGXPpI1z52HrPM0MAOSwQEoWKDIDur98Rd4K6ng
 OrcACjJHYT45zr24KU+1r4iRhLV/W7eAgjobC58uLLfugxSfG6Lpsb9BE61TfKyuOvnj1gAi5Zo
 /UYQ2uO8wot/P7pyabJyXS57JeTQQCe2SCqqhJgov4/SdnJqEtPorLty5RRBcJQpIXUqBixFboV
 cw4eL6EuNlQQ/tgq9vw==
X-Proofpoint-GUID: rybb2gg50n3X328j4HWYjYZd99iJAfWZ
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6efe42 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mo4jH7J_H-v84ocW3QcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rybb2gg50n3X328j4HWYjYZd99iJAfWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA2OCBTYWx0ZWRfX4Z3ntCSS+IR4
 KFZiBlB+hVZvPb1lrQDszVjVsYsl0dXbS6xecUHdd7J7CAZhSj4kBpQDSqOmjNyEPd7E043CyE0
 Adv/TGspd0CIJeHp/PcfhhZCzqdYF0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020068

On 26/07/2026 17:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The new alignment rule incorrectly forces a standalone closing bracket (e.g., '>;') to align with inner values instead of the opening bracket.
> - [Low] The hardcoded error message is misleading when target_offset == 1, as it claims the expected column is 'under < or "'.
> --
> 
> --- Patch [6]: [PATCH 6/9] dtc: dt-check-style: Fix alignment of values in continued property lines ---
> commit 3d17d86c35121d71a779318164c4a25fa384d8c1
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> This commit updates the dt-check-style script to enforce that continued
> property lines aligning to inner values are indented one space past the
> opening '<' or '"'. It also includes tests to verify this behavior.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 4d90fbec0e391..171a5e12fcbd8 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -928,15 +929,18 @@ def check_continuation_alignment(ctx):
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
>> +            if not re.match(r'[<"]', cont.stripped):
>> +                target_offset = 1
> 
> [Severity: Medium]
> Will this new alignment rule incorrectly flag standalone closing brackets?
> 
> If a continuation line is just a closing bracket like ">;", the script
> evaluates re.match(r'[<"]', cont.stripped) as false, which sets
> target_offset = 1. This forces developers to indent the closing bracket
> one space to the right of the opening bracket instead of aligning them.

There is no rule for that yet.

> 
>> +            if _display_col(cont.indent_str) != target_col + target_offset:
>>                  yield (cont.lineno,
>>                         'continuation should align to column %d '
>> -                       '(under < or ")' % (target_col + 1))
>> +                       '(under < or ")' % (target_col + target_offset + 1))
> 
> [Severity: Low]
> Is this error message accurate when target_offset is 1?
> 
> When the script expects alignment to the inner value (target_offset == 1),
> the error message still tells developers to align "(under < or ")". This
> could be confusing since the target column provided is actually one space
> to the right of the bracket or quote.

I'll improve err msg.


Best regards,
Krzysztof
