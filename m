Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7B3D9665
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742645; cv=none; b=EkjpO3JN+GLzK2XfTc5WDGlEGf/E7XtSiOqaZqBwZ37IAFdnLZyYyyEfhj2uunjdC746Tx5RYqdl7wDiR/j3gs5EmDzvp2ecQiwcbzKf/ND42odoVVlY9vUy9RjjZqdG5YrKrnccAWLmDBIyWr8Hx0M+oq8kAONOu99teBFp1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742645; c=relaxed/simple;
	bh=42IyvtEwaJBu89wXeBQMKR97aEKu9kfjgmjSlOW0fV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBxePQe7d6IIyYRMUzpoct5sJhJHylDYfo2xfDGiDmF34UKA/UvBMseOxfuy4lgqJu62Bgnd8yo7ojKiMsX7i5la35I2Kp4wiU+B1WB43HnHRBPg56JjFwyLfr1kk7kScyDHWcTv9QdhLEgaH0nq0crpvzX8IzKwccG/FHmNS3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne9IMMZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEtZKyed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne9IMMZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEtZKyed"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHB8A518818
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICx3dXS4wPUw3d8og8xbxa80/mdBIRAb+uYv0BpUUvk=; b=Ne9IMMZ55nG+OeVs
	qKlnCJe06/DBXik3oR6snU/PltUFJoUMxsH92DIKIAKTziCT5cDmdHvmtVSxzcsG
	oFMYCcjYzKgaSC9f+TNWmaNe3431Ab0PmlhZNoQN9oczBCfvGfunNENhyJIbDuPz
	ZAdFRe2Y4Faq0Kdjtpw9wFzdmJM73OBkAc6rj5k3N4gr1ueLtg8XPVwzIDA5WTuA
	dTq4Xo+apoPzFmb1iWAJLkpdnHjqcFMYrt1UFp/b0Mc7ApnC72M+bvznn0F8Uy/J
	vzI0lk0Xd2Va6SQtx73z9o9CektZKdIcVC4sek4r2UgAP0rOvvl8sJIAkRIx9PgD
	4cI0MA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n07k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:10:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso14240331cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742636; x=1788347436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ICx3dXS4wPUw3d8og8xbxa80/mdBIRAb+uYv0BpUUvk=;
        b=WEtZKyed6YAE89NgMFNG8eQP8irEqg0Qcw5kMONLrFhooSb0wfAGeH1LDX6TGIIQyT
         L24SqzEREdZXUxSwPyGDPn82HU54si9HxPd/TwchR3vFW421E69O8zVe/u19hAKsc4Ya
         9kC4BAf3OVpEWXQuj0IbmqXZMzxhkj5GK+FnYTBRF8eJkT4MYv//6DBDW0kx3PrC8VIK
         BrgXuNxuVfdMz6iGb7z7LxxEFhdQWURZDMDxYpK1Ktei3OEGQk74aZP765QPGyszDkT5
         69oA4HzO4a8dA+bYJU15LJZoaHEzV3E1CqhRvPa7NM5k3vXEuNZNeIHYo0ALVEbE29P+
         zRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742636; x=1788347436;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICx3dXS4wPUw3d8og8xbxa80/mdBIRAb+uYv0BpUUvk=;
        b=FLcu6xKtVEXapp9M4MqsPHyZPB4u1z/mY6z0UiBHpANz8lQnngDzm/9VyxzJe6LRn+
         NlhxXKE4u9zndW0LhA6wbtrxdQP8QmZkLDDmZl+Nip1ubm7E1zIeGet1JhWvAfFpYdtu
         sKjmT58yx85KK4iXwktWqxz5Z1Ff3J2lzAKpnIWK/u89O474CHNaNRdJJIEORFG7JcX8
         T6OiAgmkkdp4DpBHtwBibXrYSKrR0VngXbTpJyQnEjfBfnkALiR8Z+ADaEudBu4fV9MD
         n6PVPbTvQjNas57zjBrW5/uxiGbyUsWtGp7UhmW8tvv6EtGagCVpL5sr+mC0AVmjRCxg
         6LLg==
X-Gm-Message-State: AFuF++lH8Lqb+Q2I1h+nAEtWZSlwe6SR7o/+S7iLEhXjh2Gcx3BRUcQG
	WMRMt1peXOuEo+JG60BmeTzxgrE4XZanhHU5uEDTJIGG+6KfUQ1ZgUpExSIznvZWnWYsEXLccY9
	cn0BTrj9sFMsFLv/yToiWCJE+mcfq5JXvl3vOVsxmr94Km8s43kdBW3KcRPXsMrjF3PHQkaGn+h
	7osPo=
X-Gm-Gg: AR+sD12tUaWju7qTBiElTnm+0VoLxge2r508zPuy+6IHdTfQfeyDWmv/NKKJLoosBDb
	3RADCjA9/JFqmvdLLn4VxCJTMfFDwsfGUtlxvWPoAAKRGUjD//MJQhOjBL8de2uIyt6PlyA85X9
	iGVEfO9ld0rcuTW0djYiJ4z1kRFPGI93muvJMj1wXQYttB3dACQsrWfiFdXKwwwcyvA6I7KsAI7
	rQIqb3Z+0+lhJvV7ktbdD1Q1Ote6r9lecjY805qMSFtU5LIOBSN6pXBVWZXjJij1nMtS5Y0G4ol
	xW4s/XFtC8xM8uMQaWmf8bc051CZ5M/Zw18iAKS4GRTznIVtWt5jHvuJuHjCbIQQbhIYMeOb2En
	vxfRle7tMqxw/LNy2Y24VrZsJCs1d
X-Received: by 2002:ac8:7d93:0:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e42275bcdmr49651871cf.10.1787742635645;
        Wed, 26 Aug 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:ac8:7d93:0:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-52e42275bcdmr49651351cf.10.1787742635201;
        Wed, 26 Aug 2026 04:10:35 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b16afsm338296466b.47.2026.08.26.04.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 04:10:34 -0700 (PDT)
Message-ID: <47e4355a-8658-4dca-9593-5d1735188950@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:10:32 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-3-fdd16ca6e771@oss.qualcomm.com>
 <20260826103400.74D2C1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103400.74D2C1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a5uLOI3V3XCVj9s480wPJrH6qxmfMmIF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX4uWxBh+LwSMr
 J8z2t13GF1QrRZ/7eneps7J+EqHTCBkbdWNFZg1wV3WDyx3And2nDWEsUY1lCC2+ve1e5a9oVPI
 vdktiVQFZmj+gvNCnYFI59OUfQ4T1dA=
X-Proofpoint-GUID: a5uLOI3V3XCVj9s480wPJrH6qxmfMmIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX0Bw2/hB/HHhT
 8z3qs6h6YuCCLWnLjCV2wY2CAkbMvh28Aa/zVU2ld4OSdxupgxJVR5nGBuEmmvieaGiPMHiwNrz
 V7EDDiVDETbaf2K+SFSzp/ibWxgRkpwec9s3MukTCjN6qrWRkKNx7V9SPb+yJt3kiUOc5m+FjN9
 pxvLah0Jj89/Vr2VkngdO7Gfrx+n0SY3X1q9pjiv3kI9QwsW+03pKK1koVY+Fkjt+4O2WJ2BgLb
 YUjAh8U2xqMdZpizHNxzVhBGG0UAD3XitPzLy5wowFaFpx/TKfZtODDsYPdcGmlHp5nGfrG4qAa
 9zeR6Zqt/P/5bT3vge7a+8qj9tN6D25CIY5IGESGcgrj5eNR1KTk8IQapK2Myx6GDvgrokXYHeD
 JolksT/ni7pB3TxBwAm5eiro8Ih+tXL2TtzLWRzs7I5p1R01eREVsl2+gL6e3PNCRTfjbjO297C
 59Xs6FdReXMfvT4EpBA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ec9ac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XmQq5QGuDZr-Ig0OuBIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260093

On 26/08/2026 12:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] String index calculated from stripped string is used to slice the unstripped string, causing incorrect column alignment if a comment precedes the first '<' or '"'. The `check_continuation_alignment` function uses `_strip_strings_and_comments` to strip comments from `rest`, reducing its length. It then runs `re.search` on `rest` to find `<` or `"`. The resulting match index (`m.start(1)`) is then incorrectly used to slice the original unstripped `dl.raw` string. If a block comment exists between `=` and the first value, the slice truncates prematurely, discarding the visual width of the comment and resulting in a `target_col` that is too small.
> - [Medium] Incomplete detection of closed values for space-separated arrays and concatenated strings causes false positive alignment errors. The `check_continuation_alignment` function tracks whether a value block is closed using `endswith('",') or endswith('>,')`. This strict check assumes that completed values must end with a comma. In valid DTS, cell arrays or strings can be concatenated across lines without commas (e.g., `ranges = <...>
> <...>;` or `prop = "first"
> "second";`). If a line ends with `>` or `"` without a comma, the block is closed, but `dl_value_complete` incorrectly evaluates to `False`. The script then unconditionally applies `target_offset = 1` to the subsequent line, improperly demanding that the new `<...>` or string be indented one space to the right (aligned with inner values) rather than aligning with the leading `<` or `"`.
> --

All rejected.

> 
> commit 3c5fcc59a610ff8a5dc6318a90c848ba441566f3
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Fix alignment of values in continued property lines
> 
> Continued lines in property assignments should be indented to opening
> '<' or '"' if they also start with that character. If the continued line
> is part of previous phandle, then alignment should be to inner values to
> make it more readable.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
>> @@ -938,17 +939,26 @@ def check_continuation_alignment(ctx):
>>          eq = dl.raw.find('=')
>>          if eq < 0:
>>              continue
>> -        # First '<' or '"' after '='
>> -        rest = dl.raw[eq + 1:]
>> -        m = re.search(r'[<"]', rest)
>> +        # First '<' or '"' after '=', but ignore comments and strip trailing
>> +        # whitespace (e.g. remaining after removing the comment)
>> +        rest = _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
>> +        m = re.search(r'\s*([<"])', rest)
>>          if not m:
>>              continue
>> -        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
>> +        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
> 
> [Severity: Medium]
> Does this strict check correctly identify closed values in space-separated
> arrays and concatenated strings?
> 
> In valid DTS, cell arrays or strings can be concatenated across lines without
> commas:
> 
>     ranges = <...>
>              <...>;

Not a valid DTS.

> 
> If a line ends with a closing bracket or double quote without a comma, the
> block is closed, but dl_value_complete will incorrectly evaluate to False here.
> 
>> +        target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
> 
> [Severity: Medium]
> Will this calculate the correct column alignment if a block comment exists
> between the = and the first opening bracket or double quote?

Might not, but that's not the code we want.

> 
> Because rest is populated using _strip_strings_and_comments(), any block
> comments are removed, shortening the string. Using m.start(1) from this
> stripped string as an index to slice the unstripped dl.raw discards the
> visual width of those block comments, resulting in a target_col that is
> too small.
> 
>>          for cont in dl.continuations:
>> -            if _display_col(cont.indent_str) != target_col:
>> +            target_offset = 0
>> +            err_msg_explanation = 'to < or "'
>> +            if not dl_value_complete:
>> +                target_offset = 1
>> +                err_msg_explanation = 'to the value under <'
> 
> [Severity: Medium]
> Since dl_value_complete evaluates to False for comma-less concatenations as
> noted above, doesn't this unconditionally apply target_offset = 1?

Comma-less concatenations are not accepted.

> 
> This would force developers to misalign their properly styled code by adding
> an extra space, producing a false positive warning in the style checker.
> 
Best regards,
Krzysztof
