Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592195;
	b=0gSG+tOkLbiU31whhZ03kRF5sG7frLg9Fp0XknNJXr2JLtgUAeG5OCRMHuJspghVKAR8
	 SMVmaygAShRk7YHESI9gY/fdwjadc8leRfAOMl1rrIEu7iTK0LKMrBINc6N6lzj+WSLBy
	 g6F5zGZfwxrKsjCu/66I7ycQEKty9negTBqaMQwu/RAesgbdcXGBrmXFGOJZf9oUZn2uK
	 ZL1I2q+aRD3BZy1+1OgmeE42RoSQwwtgOHHj8evEiOQ83Q8MyvW+ZbrJTPy8SVSIIl0GR
	 XKLlZzJEVhdWYwJ2KdqfUUJ4CMmFOlYE6Ihhlvj6CZgq5up98N0uouYNL3U1bAj45sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592195;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6b1wIRKunjyQ1hiIK3+XdFgdL1MzFhXjhe9HykORHEA=;
	b=P2FaqkcjcYuApTXioGIStto/FBiodCZcsxsrIjUiY9oTcfKsnNjqzdE3qGLQU5QjTmaU
	 XOOdBV2c8ZK6+IJqc7quuaQkZ8SSvMBk6FDtDrcKapy/nGW9bxRV+krayBcZfOReI1h7a
	 RG/rHlI2/MC2vSNfdDe/H9zfVvVxmVGqyMNwmiGwl75MxKCGv4gHYsL6CJVqXMmoj/Iqa
	 Xkp8WNO2byIvp++JihOuu6glnXXlMyGRi1Y3pCp0AGubIN8RGr0DEtvT0nu7iNnAvKK07
	 Jeu2u+tGPKtsxbYKmo2+6YOLGZvWhZsGkNJytrxnJy9Zr08DkmH0iF/Rc5X3p1nKTxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RUFy9rPv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF7606E200
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 17:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RUFy9rPv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE3D1F000C4;
	Fri, 13 Nov 2026 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794592195;
	bh=6b1wIRKunjyQ1hiIK3+XdFgdL1MzFhXjhe9HykORHEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RUFy9rPvpTRwPT6FsdEmCi20+t5KpAW1p8oTtPXA/HHeEkvrgW5mO+MUHPKier68r
	 qDjP1lLtnT4/zUzy40QFQM17dtB70izVROV+7Dpj0P1dsTW5ozs94iw7tFsNC16Usb
	 xOIJHJNNkYw1gb0boeRZExlerm6EX2tF05jeHdls=
Date: Fri, 13 Nov 2026 09:49:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, =?ISO-8859-1?Q?J=E9r=E9my?= Jean
 <Jeremy.Jean@oss.cyber.gouv.fr>, Zi Yan <ziy@nvidia.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-mm@kvack.org
Subject: Re: [PATCH] mm/khugepaged: reject shmem collapse ranges beyond
 i_size
Message-Id: <20261113094954.942014a255165efc812fb2a5@linux-foundation.org>
In-Reply-To: <5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
References: <20261112142335.2749597-2-Jeremy.Jean@oss.cyber.gouv.fr>
	<sashiko-outbox-212974@kernel.org>
	<5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 15:56:50 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 11/13/26 15:25, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found no new issues
> > in this patch, but noticed 1 related pre-existing issue it does not
> > introduce:
> > - [Medium] mm: xarray node memory leak in collapse_file() [1]
> Ignore this shit from Sashiko.

There was some ball-dropping with this bug.  Shardul posted a fix last
year:

https://lore.kernel.org/20251204142625.1763372-1-shardul.b@mpiricsoftware.com

various ackings happened, suggestions made, other fixes developed, etc.
I guess Shardul gave up and went away, who could blame.

I'll add all this to my backlog pile and shall figure something out.

