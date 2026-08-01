Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4847372B5A
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619151; cv=none; b=hQvE6lWgwu1v1utAmHck53tuADIRLv3BJQl4aRG2qwZCtzn9fAMN4phOD25EwV4m2gKlKtkhQ720B1UD/Ip2mRPNwTIHVNj2dJYf2Sw1Ugw4h7Efbp3NqERN5Yt3L2HeVx2a65YiONyJDJmoseNbACx46xDu3avi3lKlE5ldseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619151; c=relaxed/simple;
	bh=0jUw3tjQQAofN4N6n/gV9gE1tx3+16RRsto/cu8hlro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hxWcgtbMhWiIhm6AodRh9EoxV8zpuxX+OfSvYwHmGztLVTjZ/85xQb3QBXIgYMaiee9dbWEwiTtG4itYNQKmfs4Y3iyoyp7wEc0LAVBenS+FUgpPyP/DM6HIhL2mQlmUFG2NKrj90YSnI2hetUCCn7Sh6wLoFAfK9Rwhy/VEjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpCLYbiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpkEiB4R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpCLYbiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpkEiB4R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxlIi3909158
	for <sashiko-reviews@lists.linux.dev>; Sat, 1 Aug 2026 21:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=; b=CpCLYbiRBW6xXPaz
	OGwudNRwgSYj2whGmjMQbWimsj9dO4qHvcVTWPOrXEMeC43GsNgObRX8Hn7MAqBH
	gPiewQGoCW2RSrGbOyU90z6q3qHZuC0wGMes62aeSp8KWEvkMHO3cVeAir/m2mpY
	MV6zBlSBCaCH/vc3mhSx06lUt6K4CZ20MRXiFlrCir5cxjfHOAgWKVUcwdWVBJwu
	kPlwuvG0OA5tImCkpTog1cDt88oeJhR+iEd/LvC5J97iacfXYzF6T7t/iKpjUikt
	WRK8Tzzbugu6KKHay41Qi1Vsrcyu5tOXiIU8NUBiaN2Tyfn3tzjEKkaYP/sezXo/
	7sm0jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9119p0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 21:19:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so38165661cf.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785619148; x=1786223948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=;
        b=cpkEiB4RoKThIS4wfnU2E1cm1OxDhUm/MCdALQ2NhoM1wz13oujlpBA62U6nH7Gg7N
         I1fQ+CMCgaNP4i3776TC2ltKiCN9+s3NAj11oXJ8OrGUhysQ/VRHrV4f4Ddul/3QV8ht
         NKqPbIw+ektlH9sX6bBoXvWpf+vzWfTReiWu5t8xvPuuEcYMwnrGK1ZCJzddPQbyTbKJ
         nXnmRheZJRDv2SKOKELbVHRm+XyF5BwLwpMkqYCCLTir35CUrB644BbDVkXCDqcc11Zh
         4/NtKKFO/tJjCjor6yItqy5SrWcn2mnMLdnb/D6Iphj0TNoeZHGBcOHb+8Qls2O7maGa
         bnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619148; x=1786223948;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2otRJj+9cvxwazAN+jx4u3zSSSqBcvHsk6vMl6Bhfk=;
        b=lsxMy7DnOCR9y6W9dfZJpLInHldTRIFZ8Hm9dj348Nz6WIGNQZY4gwJzf45mfp2VWR
         5oC730HIW7HiuH2PY6HVLj9sZOPr5yJrUhZXVLQM+paPg2Y2IRsgaPavZKSOpnfx0QWj
         gSz2FGzJOg8K76me2L/C+JxbsyN5q0mQA29Lurmo85b7ie6vekyp7fgvAWRXOAdM+LDm
         Tkr0TkHCNyv/5y16SjnuFnmIMDEIw29bx1B3q7WITaSK6bwUBjxzpF4IAu+8FH/XuaTP
         n9kpxyxaGZS0K7rVC3wKBzUAnZeriD44k3wjFNl+eMOufyh+rHxKRvGkrzEvhDNV4/OB
         8DgA==
X-Gm-Message-State: AOJu0Yx5BMKlZcBjYvitAUnBufjKGiorbP6mbLzEpc+wTqdFQoWlKMzW
	Cof+odOSsA1SS8fg6vbyfJQIGOj+EE//xYHBGnrF0vngBU+x4glQ4qmATgzfdm5tr9cM6ZiGlxO
	RDa7exh9gTV2wYLku7omVPGfstl8FdYLE4+OO0Aw462GXvlm2nZBhgmcCIVzT9frbDDLWbCQO+L
	NfI2Q=
X-Gm-Gg: AR+sD11yh44FNnQoCRsvZhXB9QwyFDHOWd00FD6CP7qaehjwzNj0dWhCR26L532UzRW
	CKTq1fwL1t4pYbfCaeT6zrX79uIkbxjOxmfMYC9pmTDbalUAsb3bDjbtuAnPGMYhdqcqTWZFGHo
	YicJBvL2eVaY4kGmTV5eQrRtXcvS1BM+Ly4D9yHRc0K5B4xXihnvZAiQByaimRylKIUuOEYYIrM
	Hq0CO16fMC5qe+IWoBMndrpVDsXFRVe9n8nJ/09VVQFE+NRnQ2nKZl6Vk7iaC+ldLCTmroDx4u5
	iMVD+h8Pucu8OV5BTuAFKgVP+3HRLbXffXfQjGy/3DrS05LIsEY1c2ih/VJrwmcsPCel48fxlG8
	Q4bujJkuUIH+qjLUrih7AaXFTwCo/IQ==
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr91263821cf.9.1785619147690;
        Sat, 01 Aug 2026 14:19:07 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:517:a7ff:935f with SMTP id d75a77b69052e-52b5666b775mr91263501cf.9.1785619147193;
        Sat, 01 Aug 2026 14:19:07 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4981248661csm5262275e9.3.2026.08.01.14.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:19:05 -0700 (PDT)
Message-ID: <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:19:03 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
 <20260726155702.DA55C1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155702.DA55C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfX9bgiTssvOM/x
 21SZQ2TlkyQgKPbn7k3/0MhSLxFnj8UW80ol3w8pFUxjgdqo2rO2MPrxX1vW6wTIrlpNv+gZKDK
 faJrVP2XwrcuL4x00nmF95NxqVdF4OM=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6e62cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ijNvPFITslbISghIKdgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9rlijpa-GEqIn4DwdZOvD4sZJIJiOacz
X-Proofpoint-ORIG-GUID: 9rlijpa-GEqIn4DwdZOvD4sZJIJiOacz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfX15rAxOfJ1q0S
 +kNK19QN2thd2hyZOq3RpQbrt3aMzY9Zhzu5kErKmvWSntUYOn7txu1mcbGmNjrhyQj22jJ9hew
 QtjfeNUAMS5IVJl5q8He+wUjyhf344rd2D3W6AyVpJYctvKIEKk7qH+1ke2NijDUcNAf5g/307c
 yPtICfnKLP/AjSSozQgX/nYRR13TseeoKXPmB7OucshKR7/KcU9JA8+jPwZHMj15ktTa46VPsiU
 iSQilC2kxeGUsrghAJmvAnsWm9XDpRPanfuiSXwWJVHSmGg0FOwg6Q1tMfyNDkdSjwvaMMUoneX
 mGNqsfYj8KeVz27Iu5H6NMijfrcw3dl/ak2ZFKm09ALedLmsxK0uiVNH6uUeypw3haoLmB2wmOR
 FIPZTzEEm2jT3pjArCoTuH590IKYrIif8Jc+qDEBeSrYDsNqVyuLNO2Ir9Fql+whNOVKi+50Ftz
 0G1AWyUHTfcOkR/1S4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010172

On 26/07/2026 17:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Tree hierarchy tracking in `_walk_bodies()` is broken, incorrectly assigning closed sibling nodes as parents to subsequent siblings.
> - [Medium] `_property_bucket_root()` collapses standard and vendor properties into a single bucket, breaking canonical property ordering at the root node.
> - [Medium] Top-level addressed nodes are exempted from address sorting but are never subjected to the node name sorting claimed in the commit message.
> --
> 
> --- Patch [4]: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level nodes and properties ---
> commit d752014f34dc3d4a2a9f9617748ec741da0cb1c5
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dtc: dt-check-style: Handle sorting of top-level nodes and properties
> 
> This commit updates the DTS styling rules for top-level nodes and properties.
> It skips unit-address sorting for root nodes since they mix unit and non-unit
> addresses. It also adds a special case for the 'model' property to sort before
> 'compatible' at the root node.
> 
>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>> index 1937c6feb57ec..db4451e30dfbc 100755
>> --- a/scripts/dtc/dt-check-style
>> +++ b/scripts/dtc/dt-check-style
> 
> [ ... ]
> 
>> @@ -496,15 +497,21 @@ def _walk_bodies(lines):
>>      in the input. Skips ref-nodes (&label) since those don't have an
>>      intrinsic ordering."""
>>      body_stack = [[]]
>> +    node_stack = [[]]
>> +    parent_dl = None
>>      for dl in lines:
>>          if dl.linetype == LineType.NODE_OPEN:
>> +            dl.parent = parent_dl
>> +            node_stack.append(dl)
>>              body_stack[-1].append(dl)
>>              body_stack.append([])
>> +            parent_dl = dl
>>              continue
>>          if dl.linetype == LineType.NODE_CLOSE:
>>              if len(body_stack) <= 1:
>>                  # Unbalanced; ignore to avoid crashing on malformed input
>>                  continue
>> +            parent_dl = node_stack.pop()
> 
> [Severity: Medium]
> Does this pop the node that just closed instead of the actual parent?
> 
> When node_stack.pop() is called here, it returns the node that just closed
> because that was the last one appended. Does this cause subsequent siblings

That's intended, since we go up in the hierarchy. Current parent should
be now what we left on the stack.

> to incorrectly inherit their preceding closed sibling as their parent instead
> of the actual parent, corrupting the tree state for checks?
> 
> [ ... ]
> 
>> @@ -525,12 +532,18 @@ def _natural_sort_key(s):
>>  
>>  def check_child_address_order(ctx):
>>      """Addressed siblings (foo@N) must appear in ascending address
>> -    order within their parent node body."""
>> +    order within their parent node body.
>> +    Exception: Top-level in DTS follows name order, regardless of unit address
>> +    in memory@N and soc@N nodes
>> +    """
>>      for children in _walk_bodies(ctx.lines):
>>          addressed = []
>>          for c in children:
>>              if c.node_addr is None:
>>                  continue
>> +            if c.parent and c.parent.is_root:
>> +                # Top-level does not use unit address sorting usually
>> +                continue
> 
> [Severity: Medium]
> The commit message mentions that the top-level part usually chooses sorting
> by node name, not the unit address. However, looking at
> check_child_name_order() elsewhere in the file, it unconditionally skips

Valid point.

> nodes with a unit address:
> 
>     if c.node_addr is not None:
>         continue
> 
> By skipping addressed nodes here in check_child_address_order() and not
> updating check_child_name_order() to handle them, are top-level addressed
> nodes now completely excluded from any ordering enforcement?


> 
> [ ... ]
> 
>> @@ -597,6 +610,22 @@ def _property_bucket(name):
>>      return (5 if ',' in stripped else 4, None)
>>  
>>  
>> +def _property_bucket_root(name):
>> +    """Return the canonical bucket index for a property:
>> +       0 model (for root nodes only)
>> +       1 compatible
>> +    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
>> +    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
>> +    the sub-key, signalling that the within-bucket key is computed by
>> +    the pairing rules."""
>> +    stripped = name.lstrip('#')
>> +    if name == 'model':
>> +        return (0, 0)
>> +    if name == 'compatible':
>> +        return (1, 0)
>> +    return (2, None)
> 
> [Severity: Medium]
> Does returning (2, None) here for all unhandled properties override the
> standard bucketing rules for the root node?
> 
> The original _property_bucket() sorts properties into buckets (like 4 for
> standard and 5 for vendor). Because this hardcodes (2, None) for everything
> else, standard and vendor properties at the root node might now be grouped
> together and sorted alphabetically against each other, overriding the standard
> before vendor rule.

ack

Best regards,
Krzysztof
