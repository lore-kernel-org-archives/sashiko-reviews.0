Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296623;
	b=2XQv4CsBYUvFEiWZeHj9YScBqD1fCR88Q6HGfqB3iW3GuUjgMD8nW6JVHrHbhh5Zb+/0
	 zoSbFxbid+qPddj/evf/KotDeZWf/HeTXV1HnpHCnYNl7M85w4LWOE0PRvyoaI+vBQibF
	 u2TyELB+bXjeUmL/ONgLyikXMcGyUprs4i3m1UhoaeL4Anj7fihGjUQKe4s90GQPIgJmj
	 5v7zVQm9FS4evfACEAxw2aMyDMHw+CPhmMVh5jF34U3IoxXipepkscEElNeImeZpjYOVn
	 zu5iQiENYcepDohCqZ6122K4jNw7Ww2PjqD/fXQJfDfRihSMHTR6niQ3ZY/698wECsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P6u0rHBR+nKG0I7hTd+T8m2cWP7AXG8Lp35TLCAr+jM=;
	b=Acc9Hw6q8z4WNuz6cf3ZR3lUYYywtzX3j0QBlqY35vMX0mNAdfzz+9raOuIklkJcxG1w
	 KpwcjbE91nrWK9cb6PH9rM1sE76+eMn2AzW6s1ZLddHM5j4WPHlA6xpzSzTLO7qD1HIV4
	 60PInqQ/OMOERGNnjezfzDhj5d50+2X7vMhlZEv6/RvKXnHYyH/bPAw8YC7d6MKdzZyqM
	 Laodiy4A9EvMleZ2AboBv3OFbsprILUdBy9CHCKS1z7ZuAu1IdVRoiAavqGyzOMFumly4
	 2mCU1JIO9qIg7uBNJ3Bi8F0NBWeSkylKyPoBI/GbxxFo8pe/3eLeec9j0i9VuSFI/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=R2WPL6ZU;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="yPgNyo/y";
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91695606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 17:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91695606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=R2WPL6ZU;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=yPgNyo/y
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGYnso1782609
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 13:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=P6u0
	rHBR+nKG0I7hTd+T8m2cWP7AXG8Lp35TLCAr+jM=; b=R2WPL6ZUjrui4fmhn+Sb
	e5gUuP1PcNQgEhpFzYKIMjAXUlCBgrAZFfkmm3XlKqse9oF0ByxyWXob4U/8jsI7
	UG3avqA23zTo9Rint/Ahb7tLRBn99QfnVE6johJgca7U88xHG3fazeMGoSKsKuxF
	VyKAGdu8hGjLMmB3oOaRNVdENLuZhc6z+K/XqWg8D/c0ExoVjyP89NQAAOc/dB6H
	WUbsiI3nCIEC1zGOpR8Xgmt4+wKX3PUEdrwKLUXqu/dlDKsJJMF4i5Bw/XfFFqYQ
	QkJ/lAtndodswk3q9A5u9jLk2XPikQEu2Ocb+VszZ0YRLh7F1+9zSXhm5LEUjPMr
	jA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hm661k0gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 13:57:01 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso450444385a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793296620; x=1793901420; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6u0rHBR+nKG0I7hTd+T8m2cWP7AXG8Lp35TLCAr+jM=;
        b=yPgNyo/yy15TFFvN/PkPDGV09il5X2n+krqqfPmTQejcIOm9OkzNhZoqBQvr6QxQQc
         EMOFSb7gCAyJ2vjAnYs538odpgwx1eztvUelEo9vwX1/Ybz8R5oxvFbaaWZVIgJNRjNi
         ZxaB6LbKchmjujqRhF4R/2KG4m9xgJfEKi7mzTkup0rqB+KhKU+ivBxiWGyVksSOZ02R
         y9GYn5Ikj78v3ZXaC/sWkFf09RopKj5ReuctROHtBDMLF3YsTjldSAFpJ9ojN0JUSDSk
         uz+DyFVhTuIhmv5XY7TbFLRBxSRLeWz/hgP1IpLSORe05T+/E3cJ+EiENhQbmpHvvCnS
         /xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296620; x=1793901420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6u0rHBR+nKG0I7hTd+T8m2cWP7AXG8Lp35TLCAr+jM=;
        b=sLHXGjOYS8RzZRMBuOvrtpogTfhZzYCz5hyPHres8fxdVhCVrsQVvqW/BEHhflwK8b
         rjmhH45/hTXOmMGpavj/pLBNsr41vWxeY1Sridjqkvg4+uaH1QNPlxX+XBahU775adjH
         cRmYO54e9rkFGolDECkP15aFwE+RCTnwHgbBfAXl/plmhpnSKZH23UMSwO83U7q0OOlP
         1yXKotN4vUzaXV8/gTxeR+SW/Sq9PI4MG3qHS3aRJlAnIBpmWdMqxnT1JhIX13wG1oE/
         ziVqDCPFKIXWI2/gAAXdZ7VQZ0xKeVfIN0nd3ek7hOQDZVlKmDW1wLgJhzeWG7J8uN+I
         uEqA==
X-Gm-Message-State: AFq9FYJnioVrzT/Daf1ZqEQ5fT3JnRCmsVtUi0jbZGRd5igQApokAvmn
	xQ8KJnhkpsq7AaeJgCHs3Gg96zh0UfncJJfzudvg6mlTkh2YwrUU7JldgUw2hhH9e7+2YSEVxwo
	DyaQ6AycCHNDXGhDVY422MwAjmGxGuhPtfVcIjE7fA8Rzq+rRL+ivdO3gDjohFQf1eFplLa9RqY
	Jq
X-Gm-Gg: AYBFou3nQUpEwE7fptJrjfv5B5HqlTLYVZk5lIkvxIdP9Q8wfRf/YGAzMpF20lz+auy
	bqKALBL2V53qBgpCBCPPvsoxQu3sBnwxschSgtUWvPQEInUt2EJutAQNq+ttlGbgClZ7JRZCEvE
	/w9035HMOzlPYtawEcEWsWQkRHVDvtbkn2Uf/Gzz8zl87BeJf/Wyp48Qt+BBD1awgxuVTvjyADn
	rmTzO2+PkQa8feAe0F25g8LcpAKO9vrgdOGUrM7gYptRixIAoR08WehnIyX7/38uO0LwDL8AsFx
	Mo1Q9yr8sFP/1qymfab3t6FbifFEWFRvFUNo89Qq5MFBnAipqDoZly+f1wA//oMtlfHClJD4L4/
	1r57MqojXFWykIHUaG1yi0/Rvrqo0dMyZYGR29ZwA5jGWOpTf8GyKRO7n/HSvMy0uAuijRFliah
	VzbN97lNThIrAhLP84X04VsFbgP9oQZgCjDky7teh/4dbhh/BhA/Zb/bieAAj29liqPP3+p0S3O
	UUvtDaRLnY8bHo1mMTqK+seFGjvorQeYLeiqBDh7C4OCmDAFfj5DmXDrcrX94JaWMY=
X-Received: by 2002:a05:620a:40d5:b0:93e:c12c:43fd with SMTP id af79cd13be357-94408d5083cmr892193485a.74.1793296620602;
        Thu, 29 Oct 2026 10:57:00 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93e:c12c:43fd with SMTP id af79cd13be357-94408d5083cmr892190085a.74.1793296620185;
        Thu, 29 Oct 2026 10:57:00 -0700 (PDT)
Received: from [10.206.158.158] ([129.236.230.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944212069b9sm3934585a.17.2026.10.29.10.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:56:59 -0700 (PDT)
Message-ID: <0043912c-4225-4d2a-a8aa-d160c832e7eb@columbia.edu>
Date: Thu, 29 Oct 2026 13:56:59 -0400
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
Subject: Re: [PATCH] mm/hugetlb: clear the hugetlb flag before leaking a
 hwpoisoned folio
To: sashiko-reviews@lists.linux.dev, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Matthew Wilcox <willy@infradead.org>, Jane Chu <jane.chu@oracle.com>,
        linux-mm@kvack.org, tz2294@columbia.edu, Zi Yan <ziy@nvidia.com>,
        kaitao.cheng@linux.dev
References: <20261028-hugetlb-hwpoison-leak-v1-1-77ce56002523@columbia.edu>
 <sashiko-outbox-189633@kernel.org>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <sashiko-outbox-189633@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eamo7LEH c=1 sm=1 tr=0 ts=6ae388ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=s68UaERRFoarOrKl7kvqFw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=N3hL5AxQErDOUL2KMnYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: bENF0EN4I14O3D6aqSzvWT_jJMdx1H_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MCBTYWx0ZWRfX2EOiKgvmDv37
 4ly/HlFYxLLkJgGTkzZpkiUH/HPGd2ql+0Z3YUWkIPZ3nfs89HFYPeUSUYgYwk/v0SO7LgaO3AD
 k0stTq9quMsmX2TLkY99glrd9uViVoU6cMX6Xn4BI2r8+Kg0lplzJ2N6B6qLrphZho82DWot9fQ
 /r+JNumhJC8J/MpbUH3H1NEDkNt5CWTesuOqDObtX5NUASeZ1jOaAjMFy21WnnpL83YCro2r/ps
 HryIeiPSRmMF7iWWpOk8/2OaL7fu24pq6ONKVy8Uf3N4OyYL7qerP9UoQe80+1d6xPvcYRq8OcL
 QlLy0LUkqNyTRvNemxYjlxZCQjAe2S0jI+MIO0FazRrc27iCpf5uz/G7+joj6UG20hJfgdqQjHF
 OLz7JUEnhFDdFWnC6HUZepaA6iMmglhicxJzOzHyXRlC0HZL9KeUPB8JsQSx5Y0AeleeWTHcfXC
 n+C9w7z+70PXpa52klw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MCBTYWx0ZWRfX/wxQlQPrLUHe
 EXEIWuNisfPkXpMKFmu2udQwOFkaGdnhQlM6NmKQ/3Kw2s4qdOd7FfDfvETBaeFn4Lygl8+60KN
 iN8RwgsUc/v7A5IbV/iFnXvlEN+QG/p3nKwANtgQhlE4fqZIaq9y
X-Proofpoint-ORIG-GUID: bENF0EN4I14O3D6aqSzvWT_jJMdx1H_S
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11950
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0 impostorscore=10
 lowpriorityscore=10 bulkscore=10 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290070

+Cc Zi, Kaitao

On 10/29/26 11:43 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] mm/hugetlb: add_hugetlb_folio() clears HPG_raw_hwp_unreliable on error
> --
> 
> commit cae6d1104a254ddb073fab05f2a9308005af88fa
> Author: Mani Tofigh <mt4022@columbia.edu>
> 
> mm/hugetlb: clear the hugetlb flag before leaking a hwpoisoned folio
> 
> This commit moves the folio_test_hugetlb_raw_hwp_unreliable() check in
> __update_and_free_hugetlb_folio() to after the hugetlb flag is cleared, so
> that vmemmap-optimized folios with unreliable hwpoison tracking are leaked as
> non-hugetlb folios instead of causing dissolve paths to loop indefinitely.
> 
> [Severity: Critical]
> Can moving folio_test_hugetlb_raw_hwp_unreliable() below
> hugetlb_vmemmap_restore_folio() cause hardware-poisoned subpages to be freed
> back to the buddy allocator as healthy pages if vmemmap restoration fails?
> 
> When hugetlb_update_hwpoison() fails to allocate a raw_hwp_page struct, it
> marks the folio with HPG_raw_hwp_unreliable and frees the raw_hwp_page list
> without transferring PG_hwpoison to the subpages:
> 
> If the folio is later freed or dissolved and hugetlb_vmemmap_restore_folio()
> succeeds, folio_test_hugetlb_raw_hwp_unreliable(folio) will now return false.
> Wouldn't __update_and_free_hugetlb_folio() then call
> folio_clear_hugetlb_hwpoison(), clearing PG_hwpoison on the head page against
> an empty raw_hwp_page list, and release the poisoned subpages to
> free_frozen_pages() as clean pages?
> 

This isn't something new with this patch. dissolve_free_hugetlb_folio()
already drops raw_hwp_unreliable the same way when the vmemmap restore
fails. Zi's change [1] to stop clearing folio->private in
add_hugetlb_folio() would address this so I think this patch can rely
on it too.

[1] 
https://lore.kernel.org/linux-mm/A1A14368-7A43-40ED-B2AB-C2EC2C5FFB1D@linux.dev/

Mani
