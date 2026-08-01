Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A65346A0C
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619922; cv=none; b=YhSNvx7zcBJwpkhKholASL+uhKHsjexinJQb4qBdshL58iRwrCHGf8ssBhD4sYgMiV+yzi0y/WWkHAzFCpWBJX7s8E6MieO/6hav3eA6JQS7qiY77FbONhflBAjSRd9qgkax76Qa4BBWOQ9cpmnklnBwZUL/4tzjaH7vH00/xxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619922; c=relaxed/simple;
	bh=9/50LSwQ00kegAsR4xcBTdY/nPpAPvTUHzPhkLRj4fU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fD5orkaqoAIqGVRhGV0GJsJswUBBOtYrhFQ8WsHte4rR9REIa6D3jjfXZTWkYQ/rBwcOJcDhhw2LHrJBAx+DY95+8MCwIN05V9dRmeSyd8Q7EdhrcZuvNwJ+VkQFIuiv1qx1kqPxEiHuWizbp5A9PmHenxYm+aEQmn3+C1V5y90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3qMTtSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUaD7LFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3qMTtSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUaD7LFe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxUl43525296
	for <sashiko-reviews@lists.linux.dev>; Sat, 1 Aug 2026 21:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=; b=T3qMTtSbYxFXGlcn
	yOYqvz0urxIJnPNYWVFSFyJnaOjxj3YgL2YBSf2u0fmqm0sQj/JJ0XzD0013XdSw
	+ubhYGsfDcFMWWydebdHvnDt5y3Q1V6FIzT3bvGIU3rDkWejtB4B888Qh95TrhVI
	OD9i4KPin8tDIrfdJVMjE8GkgTF0SwhmgauA+w8mZ6cc36oyOLYnDKsC6l6y3R+A
	3iviNvWLcU6ljg+6+547lkWuxKSzqyUrJGd5sFxSD7KnbKu7ikEON35pom0sITAs
	e92118QFFKg+hyC5+nToLdV9yOJWYa+7xMdnXz4AoFGg4YPr3y+eLSArGgyMR4dl
	EPgP7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa381jgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 21:32:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso41016171cf.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785619920; x=1786224720; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=;
        b=iUaD7LFeOmQGDPgQidusz4X1ubThYafhXhMbWHecnoL/1/BqZl9wZvGmGvUzSpu9IH
         a0a9Iuke1O7Jutdtepi5fdkaSHXMYiEk7GG/jgjC8hTrFxhO1Pzdq4vJtIdD6NY3GLYU
         3vRYo5FR6TJQhVnqlLh9QTJbVrdVWJ9S4wOAOKXLedhT35tEiSsJLJyHzBA0LwiDyNFC
         gYMLoGjZXhCLQnHvHYDZH8ZVwlTLtuZLelOtS4y1AVxfRCpV/26Q4F/Q2hV5Ce2RSlhe
         8usj+u0quQyTFEnlfSdUL4bXpnNCO/cd9nsZzhIuBDC/YdEn97uGMTJzscZjMXCeANQA
         gQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785619920; x=1786224720;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cr7MRvs54SDsVpd2q+AMYbFqxdS0ZlCT2xHn7jfkAx4=;
        b=ZGcamW9WP3C5EhgPMQMqwAGkNHoPGoMD2gwpOwCBaHveFYzq3OYMIQtyGhFEeMXwa4
         kVb4f/yWHDO53xRENvIb8stxyVX0qifcQE3DHrztQqNSGfy/Pta8SEJ8fMPsok8+22Re
         aX/62DNFq3Fcg6Q5O2ZkHc22MVknC2UDSXG5NU4zyd5zrmb2f3dtH/NoZnV73fbL23fa
         wYHkjpz9dXaUJJtFTQ+4Fga6QpEQe7fToxsQwbC7q5gXi3W71DyRpteJJdvYIAIf0kKC
         wWDXc0bIehfIS0gzgpz9JVGuew0bdQjC9hiTWQZFVsxosPbOKUV3dxh4wJ8AvMh4kHjV
         mJ/A==
X-Gm-Message-State: AOJu0YwGXQwUdTGyKy0VpbMN+sb1Ij7ABhaZgoPFrfrdIOuyVRx8RDLx
	+OGTF0bzfr9Ae89QBQcX1GK+Zs2hgZ3nP07nKsIVJW/o5mYYnWhl7aJIYdbmwFgfZ2G8Rp3L6p0
	e2YHThI66EFp+u41B+485ZnJ7Olc+et5dpv1P427TDxwmVx9e8WV4FHXdSnoXeD80jg8jEHHXAk
	Y457k=
X-Gm-Gg: AR+sD10c3c8RMo9+OZjN6XmCEJBnEftixFj0E7mlBkJin8nm28NudaxoHhPeVi9cD1n
	fIyqFc4/BQS8lsu4gn6y2/aPHD5OiJju8WQPSJ5FJzq7DuFHEA7xQ/fLQ4tPhvxRwyuZ+efPNjJ
	5TtnMwtngCwzzTJffO9LHZyt/ZyDfruOd5/WiwjfFaDW37U03FMWwHb/NMtme5M3U797rO64BUW
	seeKgUZy85RBLnUm/vHHlholqnQ+rno7cYX+DjzgAqWnoXoi7sSG4GwSXXyzyBFcW7eQaJA4DwB
	1Fxt7r/CP976gDNn9LTB1wNM3XkvdS2XJPL9AV8RETIBarTo74AuU2Ecdb6GsJFbVsGVfNvXAba
	nY2jU2w6qJZi/TBI+XURV/OYaU08r7A==
X-Received: by 2002:a05:622a:5805:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-52b56791f4dmr111381201cf.33.1785619919607;
        Sat, 01 Aug 2026 14:31:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5805:b0:51c:9ab2:dfd2 with SMTP id d75a77b69052e-52b56791f4dmr111380821cf.33.1785619919069;
        Sat, 01 Aug 2026 14:31:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dbaesm141573405e9.12.2026.08.01.14.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:31:57 -0700 (PDT)
Message-ID: <2e52b5d8-9499-447d-a329-166d50723bba@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:31:55 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
 <20260726155702.DA55C1F000E9@smtp.kernel.org>
 <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7177d789-5544-43ad-977a-faf64681788c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6e65d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W8r6g5I5hucPXnWxlx8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfXzDn7Hg2t2BK3
 RIa1eiV66yXEcjHP2FUC8Dt2Mw91Z/dU1IVU24GsW1o8LCSaFF4r5iAG0xUQcu1e6Usf9o9UYBg
 Ez3lqeKaKOKnO5cj69JQje+ura17u7A=
X-Proofpoint-ORIG-GUID: 0tdCX4E_Vd14R_4unv7qmcxQ0K6xS8Ue
X-Proofpoint-GUID: 0tdCX4E_Vd14R_4unv7qmcxQ0K6xS8Ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MiBTYWx0ZWRfXwcSBnQFIFSpt
 k7yhSXLm/xpRwgr5HhzLiuG+tDLUyHbPWnzELt+Os2ZSMq0MC1JMmSq3n2tEWFBNklK5BvJ+VWF
 +Alt/j9Yg/IpzLvkFo9MNLFYZgHbDWVsls4aackVdsdpB7XliCFND0+vCGBATl+pUtqPdUs5/o8
 jGrAe3CULTgCvW5Zku0sbe0l0GvQWSq9cYgmd0++iXsm19WdTtDF3DV/IHY3juF9PimGCg0F57s
 Y0ktw2kFtcpoAu4iFcaUpWBtOo/oqLd0RyCmu972W//ZepaGW80NcofldYqtfFoCsUkgpS0PkZo
 ojIivp6Up3RrzcvcLecy9XOC85d626b846IAQpIPlWKRniqv378jWtl0Jp1/HFwaR7kSvQAYpUC
 MB80XigLP3AHeXXI+zZ0Zhi6rMVcrmRAZDSyusCpiMEuTHvMdqM8qWwTeE4aiIsdXoHl9EA9vzt
 +gRquS9OO6qKk0PgC9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010172

On 01/08/2026 23:19, Krzysztof Kozlowski wrote:
> On 26/07/2026 17:57, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>> - [Medium] Tree hierarchy tracking in `_walk_bodies()` is broken, incorrectly assigning closed sibling nodes as parents to subsequent siblings.
>> - [Medium] `_property_bucket_root()` collapses standard and vendor properties into a single bucket, breaking canonical property ordering at the root node.
>> - [Medium] Top-level addressed nodes are exempted from address sorting but are never subjected to the node name sorting claimed in the commit message.
>> --
>>
>> --- Patch [4]: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level nodes and properties ---
>> commit d752014f34dc3d4a2a9f9617748ec741da0cb1c5
>> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> dtc: dt-check-style: Handle sorting of top-level nodes and properties
>>
>> This commit updates the DTS styling rules for top-level nodes and properties.
>> It skips unit-address sorting for root nodes since they mix unit and non-unit
>> addresses. It also adds a special case for the 'model' property to sort before
>> 'compatible' at the root node.
>>
>>> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
>>> index 1937c6feb57ec..db4451e30dfbc 100755
>>> --- a/scripts/dtc/dt-check-style
>>> +++ b/scripts/dtc/dt-check-style
>>
>> [ ... ]
>>
>>> @@ -496,15 +497,21 @@ def _walk_bodies(lines):
>>>      in the input. Skips ref-nodes (&label) since those don't have an
>>>      intrinsic ordering."""
>>>      body_stack = [[]]
>>> +    node_stack = [[]]
>>> +    parent_dl = None
>>>      for dl in lines:
>>>          if dl.linetype == LineType.NODE_OPEN:
>>> +            dl.parent = parent_dl
>>> +            node_stack.append(dl)
>>>              body_stack[-1].append(dl)
>>>              body_stack.append([])
>>> +            parent_dl = dl
>>>              continue
>>>          if dl.linetype == LineType.NODE_CLOSE:
>>>              if len(body_stack) <= 1:
>>>                  # Unbalanced; ignore to avoid crashing on malformed input
>>>                  continue
>>> +            parent_dl = node_stack.pop()
>>
>> [Severity: Medium]
>> Does this pop the node that just closed instead of the actual parent?
>>
>> When node_stack.pop() is called here, it returns the node that just closed
>> because that was the last one appended. Does this cause subsequent siblings
> 
> That's intended, since we go up in the hierarchy. Current parent should
> be now what we left on the stack.

Actually this was right.

Best regards,
Krzysztof
