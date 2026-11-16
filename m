Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810027;
	b=nEjOapb3zzY7dHuMpRSb3Rd2mUBjeTiKt9ePizsNSm9JX9IPhlhvjeQmZqQgFXNeP77e
	 PZWe83lO9d17r3r7+Vi+UXZljdZzIGp1SPizyPmQdAiMuL13RWxzrq5FAItWTaPS4fHY8
	 OG29EfF6yUnadfj/AlTRd4shHfC6+0v5J/kJ1HTA7ehYekSGB4M8QYheFthpFlM16tX7z
	 yw/IvLfIiN1XRasbRkwEX5CS9O15DMv5pGxKcaDtHVvDmwximtO9SL/iV8IRay7HDT050
	 qGAr89ke5+Wm4nlcdamVdG007N/beU/adaS9L+UNNxljmQ84qjQ/Hmpeeki/b3MNz9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810027;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OXwpyzmDetXMHPbJA1yBOUj/cgWMyZE8y7vvNj5MTqk=;
	b=ew4QTyyaTUeLazgrjHuw2zJeyethxWRwBG06Dc+yWj8ngH36i/1JzUFCTk5gIx0f9h8p
	 hGKyDx12/oqpqX9Mz5SPRTPL2VSrZMYXTtblyk1QvNvECl0P2Zn5Mt+yuhH+BheqYew+r
	 YX105tnD0N6YjAxcV8pfqax9DhKCEr8Cz618phWo89zSxqlIm4JYxrXiGo40hGjT+iB2H
	 SHGBDL9juGZJnpu30O5zVAawYhV6/U7CX1sc5Ymacn7EFoDF+ODQnGvHydLoMi5PrJ7Xi
	 S2UtjKyWhgoLKrxyCnvuTKb5nZ9azWdnK1JoP7+9bNueNQVyu1uWYHmhWP3nV9qgUOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YN+UxTus;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D8E606A329
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 06:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D8E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YN+UxTus
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794810022; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OXwpyzmDetXMHPbJA1yBOUj/cgWMyZE8y7vvNj5MTqk=;
	b=YN+UxTusbzIZhoTcnbBCGedZH0ri/mnFT7x6OHMpJAX5kBd30XGrDxOWVLANebU4pL+oBVKkJwYAjduUDdlDcgE9quKUIQR4w6tdNIN2xTJrBauHKxKhD2TNy+vzKO+BmmetbV1CEef3hw+6TXL89Y1Kz9imwfchD2AK7c4iIRg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEmta3P_1794810020;
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEmta3P_1794810020 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Nov 2026 14:20:21 +0800
Message-ID: <df6c54d5-be85-4818-a95c-5cb6686ec336@linux.alibaba.com>
Date: Mon, 16 Nov 2026 14:20:20 +0800
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
Subject: Re: [PATCH] mm/khugepaged: reject shmem collapse ranges beyond i_size
To: Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
 =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Zi Yan <ziy@nvidia.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-mm@kvack.org
References: <20261112142335.2749597-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <sashiko-outbox-212974@kernel.org>
 <5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
 <20261113094954.942014a255165efc812fb2a5@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261113094954.942014a255165efc812fb2a5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/26 1:49 AM, Andrew Morton wrote:
> On Fri, 13 Nov 2026 15:56:50 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> 
>> On 11/13/26 15:25, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found no new issues
>>> in this patch, but noticed 1 related pre-existing issue it does not
>>> introduce:
>>> - [Medium] mm: xarray node memory leak in collapse_file() [1]
>> Ignore this shit from Sashiko.
> 
> There was some ball-dropping with this bug.  Shardul posted a fix last
> year:
> 
> https://lore.kernel.org/20251204142625.1763372-1-shardul.b@mpiricsoftware.com
> 
> various ackings happened, suggestions made, other fixes developed, etc.
> I guess Shardul gave up and went away, who could blame.
> 
> I'll add all this to my backlog pile and shall figure something out.

I think this issue is fixed by commit ee3f01125010 ("fs: Free any excess 
xarray nodes in clear_inode()").
