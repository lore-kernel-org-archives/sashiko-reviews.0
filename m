Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793651099;
	b=mcMNnE0O4OU8mtQhdvo3SouXNSzlLsvVRFFKNpBu7maqbPFxCr339vrxEPTqhFl3EjC1
	 9Q/DecxuGNzIfcbSvGkMucLr8NwM+kuW31w4aO+wuaCc55/6kNDZ42MBI5adMDWCK5thF
	 M0/RlVtuQ3mOC1VppxkSbAXmmSQ7VRx4dNGXBCupmPo0Bsbe//rFBPzoQ8ZgFrac0ngXF
	 xQnS2CtO+x26xIHfN7CoraC8JI+q+F9bnJEZm4kKPxG2fygu9nyKbZzDcG3lFbBX+MvCH
	 L31xNBr41WXHR7fnJYBi4fL/6+N/oU9wDFoLPainDLsTk1tBPKHOjSCTnrXJ9FaKD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pjN996BwASNbznAuXP1p4D7u6OJyM/x7QZnjkTw5jXQ=;
	b=kBe/xucuAzbkC457MSDPKQJVx64G0hXdMzwSyVnb8QNvSb7eWPVQxfnWYu3SlSZR/Vf1
	 vPs0GYYAPP5ikG+rLSK+elMVmmEM9qHZrqk1lWmmkA4mX93vh5kP+Ew1D3b9Qih1oNTqN
	 7ivL0qWWyr/GGYJpWb9j9aO+P2c99irp76Jk3ldZbouah1uugvSlJJBRTIqGxJP2pTTwh
	 UJ35ol4JKpcMKF6Ylqrvp7Xr20hMOxc4aRo8qOAa5KGUtwwJty0ZCkI+1t4oI9bbfJuD4
	 Nuw9AgCkJaH9vx0T2D1bEfgxU6dejP/FIPtu5kfJw57Y4qrvdlAu6oQiS+CRLEdmYzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=CAq6ZRQu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LVIAgB3L;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D9606A32C
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 20:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=CAq6ZRQu;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=LVIAgB3L
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K2uNd1965700
	for <sashiko-reviews@lists.linux.dev>; Mon, 2 Nov 2026 15:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=pjN9
	96BwASNbznAuXP1p4D7u6OJyM/x7QZnjkTw5jXQ=; b=CAq6ZRQuUFo0zsh4mT/I
	kXvU0y3qR2UG9+MTAQ/cwGlvNgrwhTXqzfkTzKM5Ck9T7Mi+5ee3YL3NG/Ig/G7H
	0DqFbU+Wl0NKah5Fp3RQcyC7TJQCtKrglJCY0K0RgslTWk0NiBk/Jtpcj18rlBY2
	b533oHoAEEFNZlyqdTM7cyInrvE7p9cRK6BTOSPkfPD4C5txGSKteXpzy55kucRI
	OmMuyeAfnuUWH0QEcoQI6UOdlOVW7lBxKyaAD44JUGcJy07NgP5KRrOXvNM+hY+/
	P3nbhz0/vS6WEHu5hihdXVquScGiesCMD7Z4kjbC7FPy/Xhndn5PmPXHGqaQ54ma
	cg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hptgnmf2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 15:24:52 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917baea8e5dso70728316d6.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 12:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793651091; x=1794255891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjN996BwASNbznAuXP1p4D7u6OJyM/x7QZnjkTw5jXQ=;
        b=LVIAgB3LSNHwHhI/kTDKpQeO2pXd1bYd9MnL8DGOaRRDinpjagUuJzyWqQv3CAR7Dd
         xeaAZq26WSi7iQOCl7EqL4TqxcGc6b1NT3ixsh4LYIu0Zx9ZwudwHBJojAZnpitMQq0K
         Fm8mEc0uPnBKFC+S/HbnP3CtE/W0Q+Yk5dwlW429IjUp7L/g9uHCgWts30bJJRDv7ihC
         w4U6vz+/yFGcoZkjsfceFvfHcqIgjQD6lNCW4K5hUdleFtpHwsFzAyTDlRsrQ/6wcfcT
         wkh08N9XzaMh6e1IROsbfJe+4f81SJdrw3QCnXRUtusfRKcQ914v/Uu9yygGf78mCYQ7
         qeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651091; x=1794255891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjN996BwASNbznAuXP1p4D7u6OJyM/x7QZnjkTw5jXQ=;
        b=FO3JXfCMdeVDXeYjI2g43MhmC1IFlbrm5hbFy7Y3tdFN+DoZo3bOo5x/cXWOiKblug
         9Iw+H3HcivtgW3PSa6YiZpm3Yq153nlkt2blhFYvPh9YnRoFwGocZKMe6xT2z2GssP4U
         XgddZrl1iQOFJihrg9vtZWnOaok8Ysz6O2dQiZoUeif3a3BzRHT9fZsO/N3gx9PkoFPG
         ZQ2RSFG4erUd6vKQx7hcG5IrKWpIcV77tEIojgzYwC5qtKohDGrOePt3xZNN1Em8mC/H
         jpBd6ydlnzu7yeZpw40foCxdqYJqs65D7UOzLW5h1tT7nc7qWSLHqxb2/Vgh1Blspce+
         PQUA==
X-Forwarded-Encrypted: i=1; AKwUvBypmxQXw7KCiamNoPU2h5tf9kNvl0tGsElE0rTPQziNRW+dYowR0ye/HtTTd6Wr8j07A/mUFQtfCiLFucY6beM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9dOTNHqqL2dgDlKbYVu2E2fnNes9EA9b8eUVz7i1WIzMNFUndr
	yNOTu0g+q48EKgvg1aDXcKT9kwPa4iAIEygIjy94+uE/Lt7VyrMABBmsvR+JUCVUcCXAM1WnZlR
	xmCufSw90qt5MtB2JDOon2bVnfFlZFu3hYaVHjbIVe3HPl6QJAv5xvcEvbNslUlG6ag==
X-Gm-Gg: AYBFou33gIbM2ZGxYsa5mmm81mJIzg4C0luwmg5n54FAfRmBvUn9cLZ8sK0VD4fEsgi
	PEGU/qbL70a6w1QZ6rLpEr7/6HmTPe1JX00im2Wx30Q1nQVpxHoDR1XdZ1GeTpoci0OgJwZOsH1
	mz7A+bDyAsjua3EK9qOolUeH6pXrvCqVZ6K7Hn6bKj/R//7TpVS66PqY64l9yT9bVHvYnUlP7QR
	1hJD+YTY0GrBfs3KizZiKGWB4cLB1ocfbW0W7IoLy+LejZigK4L4TlDdeIl4uRcd+pOOPU30++u
	3yiAaVqCQXtqihOBYhYBCT8m+5rwdGEvFB+YfpR1aYE3TmlGLefNqP0kmM35xr++GkTOgil/oaD
	svmcH6LQDQGVNR+hcHJqDLXZITMEkXQzs08pDa7HJWG28UY6eVyOZ2WKGBh6tqru1fNWN54XVTe
	C7Js9yn4MZZLao2XVldapV4WCgB1UyuTw1lCKb94VayR8afBXnSA62SJyQ9htlGWlu9NpWearHs
	u7FKbnTdupQ498UAo8z6nwIJmfclZjraPhxger1YJvNIY7gl9nLbNTNSKQmwhmFfw==
X-Received: by 2002:a05:6214:194e:b0:91c:9db1:f640 with SMTP id 6a1803df08f44-91ca4ad2ec7mr190777916d6.18.1793651091257;
        Mon, 02 Nov 2026 12:24:51 -0800 (PST)
X-Received: by 2002:a05:6214:194e:b0:91c:9db1:f640 with SMTP id 6a1803df08f44-91ca4ad2ec7mr190777626d6.18.1793651090838;
        Mon, 02 Nov 2026 12:24:50 -0800 (PST)
Received: from [10.206.225.113] ([129.236.229.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f252ffsm100371496d6.14.2026.11.02.12.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:24:50 -0800 (PST)
Message-ID: <5b5dbd0e-6f29-4573-bbc4-1d07fbcbf1fd@columbia.edu>
Date: Mon, 2 Nov 2026 15:24:49 -0500
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
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Matthew Wilcox <willy@infradead.org>, Jane Chu <jane.chu@oracle.com>,
        linux-mm@kvack.org, tz2294@columbia.edu, Zi Yan <ziy@nvidia.com>,
        kaitao.cheng@linux.dev, sashiko-reviews@lists.linux.dev,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20261028-hugetlb-hwpoison-leak-v1-1-77ce56002523@columbia.edu>
 <sashiko-outbox-189633@kernel.org>
 <0043912c-4225-4d2a-a8aa-d160c832e7eb@columbia.edu>
 <ae6058ae-3703-a1d5-d82f-4102b46f227b@huawei.com>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <ae6058ae-3703-a1d5-d82f-4102b46f227b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfXxhov7v6LRG76
 fSkMzea7NrHFIys9uY4Ui74wbqsByJWy4XDRtz3zeDCIbz9+rviqefcLeYypCouSx0Ud3ndsSJ5
 skWR4bXdh528wyKDyCS3dzIFa2JyOdxSyz11PsVbfyajSrOhVYaX
X-Authority-Analysis: v=2.4 cv=c78+0h9l c=1 sm=1 tr=0 ts=6ae8f194 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=scx9rK10MffgfR8e+ftusg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=5XypEgDptGhv7p-PtYcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4MSBTYWx0ZWRfX6lDbq39AGG5r
 RibaKMRbeTZdny+BlPFQHepO7fzhHNT7bHeWq7bjJN38+eZ/TVaS1cRi/IcsPn83YUEGZNRIDDw
 fs28TkGKKds07kofAIGl2EcWN8X2nAq3GUlxPT2mRLZkvdRWZB7bR40iGJHdHARoOeoBbRvhTf0
 WP+X2H1PhQHlY1feAiBUZiPUZVPmlkiCGdFzqwXHn8uxo0KDZ9HNbVy4tG1DTpDyz+eZr02v/sF
 t0GGYO/E39rRWEIGkV8KgvDCRJMq0xd6hOupewDhKjRenSebYyDNSQU6unnnFaRe5XWxdrb/1Gn
 Wlb8QFahCubhLYsKx5+Ea7AzrOsV1E77Sdlsk8m0uqqygiZae90hEIEuxeFXPDlomhEIC/bt5uU
 ORNeGrZoRaW6WlLm1BUScrBpFFxW5sMJi6jbItXblBGeBcGFpsYE0CXhK9+xKyOBfIgWEZ/wKhK
 s9qf5UthjNmF+d0y30g==
X-Proofpoint-GUID: OVCDrdm6MyN5PeQwzXMZk2eN6DCAj54c
X-Proofpoint-ORIG-GUID: OVCDrdm6MyN5PeQwzXMZk2eN6DCAj54c
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11954
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=10 malwarescore=0 suspectscore=0
 lowpriorityscore=10 priorityscore=1501 phishscore=0 bulkscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020081

On 11/2/26 4:17 AM, Miaohe Lin wrote:
> But it might still not be a good idea to add hwpoisoned hugetlb folio back to hugepage_freelists?
> 

Agreed, but that's already what happens to any hwpoisoned
folio when the vmemmap restore fails, both here and in
dissolve_free_hugetlb_folio(). dequeue_hugetlb_folio_node_exact() skips
hwpoisoned folios so it never gets handed out, and a later dissolve 
tries again.
This patch only lets unreliable folios take the same path.


> Also, with this patch applied, these raw_hwp_unreliable hugetlb folios can be successfully
> unpoisoned now? IIUC, after hugetlb flag is cleared, hugetlb specific information can not be seen
> in unpoison_memory, so they are wrongly treated as normal pages.
> 

Good catch, you're right. I'll make unpoison_memory()
avoid this in v2.

> One last thing, Can the problem described in the scenario below occur?
> memory_failure -- VmemmapOptimized hugetlb folio but hugetlb flag is cleared
>    try_memory_failure_hugetlb -- It's not considered as hugetlb now.
>    TestSetPageHWPoison -- For subpages of VmemmapOptimized hugetlb folio, this could lead to problem?
> 

I don't think so.  The hugetlb flag is cleared only after
hugetlb_vmemmap_restore_folio() succeeds, and if it fails the folio goes
back on the freelist still as hugetlb.  So a leaked folio always has its
full vmemmap, and TestSetPageHWPoison() on a subpage only touches that
page's own struct page.


Thanks for the review!

Mani

