Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590419;
	b=FQztxXRma4Qo05EaZBryiYGzCZjDncChJMnK2Nk53jk+nirIBZwTO/o18U0aolh05v1g
	 c4jp8Kv1d0J4DeIj+Z+BErkvott0TcH2twuVYNeyLaj62MzhI+bzOgitZw7U/AA8jVrXy
	 1LZ5MEx3dL8KBDlI/MLRTfNo+MvmpVRN0+e3Y5wmuMzlQsX08bTf8g2jAFBBHTGY50QKE
	 jOkzFlwqpUeCUdk+YNzfuds97GBiAFMU3N1tVMhE74hcO3h+dADpNY8zKRqoPPzAY8t+/
	 eS19hdGmuIWvYu9Rbj2xi/mXhW3kuBFv2tZlc/OPoSf6wyEvJ0ejLSMK9TtZQsUophQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590419;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=Z4SrH4RVDNtmZG2ZRDPtfT86JlaE5VwGit9tIKv3JJQ=;
	b=QUCCoHnSZKWTGEVyXPTABQGWy3TuDwq/R8J9wcnYLzBLqf6TAde7BqA1+HakWGCVS0bN
	 Y+p8oa5Zc/uqSM8ix2ImChR/Rhc2Cwjab1Mc8ZYjK0y88E7ovx7dK9WLjgX2TCraR1c2N
	 xfDX6E38mHo19xfl5zXdoJ6VAHIIw+KyzKfnqDyCH/aX0SiPq4zxuF7J7Ntm9trCorf+o
	 CKznu0kv6/uHnTqvFpRz9qNRzaWszAFVmjz8ZxjZgX+YzCMoFhu+B5IjGWVxCmJOimi4v
	 QQKegDHQ2lOi90f1pYqHue64bxZQd3NU0/ulOIWVLxEgud7wsK2KNWJcCZLLXxbUfXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1b3Gxm7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9D9606E645
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 17:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1b3Gxm7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9C41F000C9;
	Fri, 13 Nov 2026 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590419;
	bh=Z4SrH4RVDNtmZG2ZRDPtfT86JlaE5VwGit9tIKv3JJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B1b3Gxm77W9VqDxwBwV3lHzY0TWR1gYFbDnKPMD8LxLeaZpBZ2ZYzt14vw0cqRmTp
	 wj3Ybj26v7A1nHm76aBOFUQD1vOYEzyefBXlhx5+9dfYCSD5zqhrgTWS6UBkId/j43
	 sV05M9HMz+gwNk2rKShUN4yQFxptFZRq79/1QN/UNi4rQd0ODaGZ2P+U+j/6UbUg81
	 yqNWsrh898VwZm5ofdrjnV1aBm39i5pgKhoC5ps/3YqdCQK6FFL6N5jQ+eqSwArwmV
	 TubhdfmaS5Lc00xq/VVt14jB2QN/5SsWoIuhfZCrazb9AX4VRSSTMFf+bYBdPrzn3F
	 tWy0h3fOXQ5fQ==
From: Roman Gushchin <roman@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,  =?utf-8?B?SsOpcsOpbXk=?= Jean
 <Jeremy.Jean@oss.cyber.gouv.fr>,  Zi Yan <ziy@nvidia.com>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  "Liam R. Howlett" <liam@infradead.org>,  Nico Pache
 <nico.pache@linux.dev>,  Ryan Roberts <ryan.roberts@arm.com>,  Dev Jain
 <dev.jain@arm.com>,  Barry Song <baohua@kernel.org>,  Lance Yang
 <lance.yang@linux.dev>,  Usama Arif <usama.arif@linux.dev>,  Kiryl
 Shutsemau <kas@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-mm@kvack.org
Subject: Re: [PATCH] mm/khugepaged: reject shmem collapse ranges beyond i_size
In-Reply-To: <5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
References: <20261112142335.2749597-2-Jeremy.Jean@oss.cyber.gouv.fr>
	<sashiko-outbox-212974@kernel.org>
	<5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
User-Agent: mu4e 1.12.12; emacs 31.1
Date: Fri, 13 Nov 2026 09:20:17 -0800
Message-ID: <87y0aw8x7y.fsf@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 11/13/26 15:25, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found no new issues
>> in this patch, but noticed 1 related pre-existing issue it does not
>> introduce:
>> - [Medium] mm: xarray node memory leak in collapse_file() [1]
> Ignore this shit from Sashiko.
>
> Roman, make it stop.

David, will do.

But also it's not how I want to interact on mailing lists tbh. I
understand everybody is stressed and overwhelmed by llms etc. Including
myself. If sashiko is not appreciated in mm lands, I can turn it off,
no problems from me.

Thanks
