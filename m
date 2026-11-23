Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411668;
	b=fokBcSa4GeK/fOhVfrlQSwQuAAuF2f+wb2T1n/msGBp2wQvGmZG9LiPDlGka7REfJqUn
	 kLM7TbLqKT9MSETqCxTBJfEyhiBNPMYN+bN/vEXVJieYuLoPAB234aZdNnmjRqzkeEahT
	 xaBJ4wFPS5uyvU5+8yqjecLxUVRDmotqnECeSZ5ck3U9UPAleSod7aWimHAmN38lM47uQ
	 9gvK8PPBNB7t/j8MrVrc005YA/2p1M9a0p5hmJS4mS71UNqloRxuNWkEDAMDfkJe0+OnX
	 SOxh61pt1qrHpJgCUTV/AAUE2SivEhTkzhAWpyjktanVcsBnlqNsJ9Rp+OARmcq28KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DNTKVcF+kDGwUT5mkNEDzxX6VPdSRAfD0Do5dvR59q8=;
	b=Y5j/GeZmPXtDgvLmmPhwE/aa4EkUBvBfews5lYFBdpAjWJo6npbRpvn+fbEtUGjngs5y
	 mnz94zvy2pOsoMY3y56QpORwPVkLfa5TnTFQLXN8JZWTsMWtZ4efGlJbT5DVYtZwmqvhZ
	 g6nWdVFqwIeqcRFHfsGCuYneQV7CXTYx5aGzdpfHM3d+dYFnPTGMImHifXQ+Rc6Cq16cO
	 tq9GPJEjUHLMHUDMUFJV4QZbRXgX1wI7ASgf84qei4D0GTJ2tpzZfhQmxw7XN5KVMbLxJ
	 s50fFJBS+NzslBp86jawlvbSIr7m5O7ULDxG7LwOBr762qpyg1GFGKauntzFL03puWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BZQogTnW;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E31D606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 05:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E31D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BZQogTnW
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so422195b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 21:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795411667; x=1796016467; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DNTKVcF+kDGwUT5mkNEDzxX6VPdSRAfD0Do5dvR59q8=;
        b=BZQogTnWnNXWHgtsPfdNJQbxAAO6RivWpCV74YSYNQkCGV/eyjj35XzaIQCF+IBpow
         Uj0IdGTglOHhYnalTKULjb8SK74lyuqUvNIweXTCv8bNtD9oaeaRhHgFvJd/gpiEmIsP
         v13aGo8x6DflJTAm/llGyk7mITFA+FKrUB9S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411667; x=1796016467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNTKVcF+kDGwUT5mkNEDzxX6VPdSRAfD0Do5dvR59q8=;
        b=LifIioAYv29NogvoluIKYHwphWFRPuy4K6ygPIsCJWNb6ZjEkcGEvWFSGVh7PmKNHc
         R8zJKoalE38L6qZgCq1Za5ogQenozUvVTSPrRpV7sOYD9ddYFPNidYiYq4F8oHg4RC0D
         yVRcJwx1FZnrBJf+U37XIh14fIl5HTvBSD2Y6f4LS5bTTuiFV46NPgcmojddYwKET2Xi
         +qKGa2iplAVEC0t5GI7OlcE0Rfsp0VB7yr0sAlhcKRExrzNLtBjVHhtALc7Gls9lV8aN
         U4hmfgFpg+v/SyrKLWL/1VZyCvdri2XWr3E5KaRW4BMp4ZO17KNEKmi1q0S4beMQW2E1
         cEdQ==
X-Gm-Message-State: APuU4Z/AJ261D9uvih5dFkbEp1KT97LsXGynSjYSozIdmw4AJZfcbt8A
	DpfRgZRG417a7S5wX82sy+V8XSoAmzCnCPbudBhZXuZ4AX0UwvySU7v7CxAcWMXZ1M6CBbTl5KY
	5b3s=
X-Gm-Gg: AZFdTZetbfdygOTvmpjNz0fLsncXnA1JVHRJ1p72Y0iQxcoBmYQuaRqyOy83y+b0Xwe
	79o2WC573M50BUtmQtI7887D6zBfEK1P3YDVwIP6T0KLkAgNT0kYrGi2PSOEFA6xnMTqlzHlLbW
	6jx3zR2sg3neW8c2TxLV6iVx+lKaTBT6tWcA985eaMgEPOVwwraimThcT/Gpxy/DsUsbYYz/XOq
	bQHpeZnekAuAYHSVQfREogpGjSoxRQXhEsrNhxb7Y5mdxDMSmVk8qJCNBvRXXuxux5yj6yzEZ8T
	w84SHX1KF0Dl0Zc6II/p4pYcDBgq9s7m/3Gqfu6s2fv5MhSG0EygR1F3BT3DhqI4uF08hZaZ7v3
	BYdfCc64gxYuhuPWkd0MJGBwbXea6LZD6GjVeB+sxIvozwBAoWb4osBjSQlIRYQLNzjZhiUExoj
	BnqEOG8LcxgwZBlhgrkrLkDWrMon+CqHs2rV+f7xYnKgf+1j3eXDEe4AHLOIbpGIJ7ij+cZZ/gn
	WJ0RuDHfBS4C0jYXa50Tj249U2mgCUfW/dy1kW4CK2ZVD0eLDAgKnNFmqjtP54E2PchgfirUkde
	gDnnx5lKnnnZ4hkymqN9BLnaVgqSl5IhzNOCuiZ2Pkw1YH3+DrU8hYokeXUmio+Z+zEFyw==
X-Received: by 2002:a05:6a00:1818:b0:8a0:5d8f:665d with SMTP id d2e1a72fcca58-8c87d80b3b5mr8569194b3a.58.1795411667613;
        Sun, 22 Nov 2026 21:27:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm4698086b3a.34.2026.11.22.21.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:27:47 -0800 (PST)
Date: Mon, 23 Nov 2026 14:27:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Hongfeng Chen <hongfengchen@xiaomi.com>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] zram: keep the hot statistics per CPU
Message-ID: <awPN3Fiwcej4_IU7@google.com>
References: <5666c1c8c04998784c81fc8fe751e35aa40af578.1795403342.git.senozhatsky@chromium.org>
 <8f0ec29c0e4230d10db088d29f79bba17c3ee6f0.1795403342.git.senozhatsky@chromium.org>
 <sashiko-outbox-228621@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-228621@kernel.org>

On (26/11/23 03:55), sashiko-bot@kernel.org wrote:
> CPU0                              CPU1
> zram_write_page()
>   slot_lock(zram, index)
>   zs_store(...)
>   set_slot_size(zram, index, len)
>   slot_unlock(zram, index)
>   <preempted>
>                                   zram_slot_free_notify()
>                                     slot_trylock(zram, index)
>                                     slot_free(zram, index)
>                                       zram_stat_sub(..., 1)
>                                     slot_unlock(zram, index)
>                                   mm_stat_show()
>                                     zram_stat_read()
>                                       sum < 0  <-- loops until CPU0 runs
> 
> While the writer on CPU0 remains preempted, the true sum across all CPUs
> is negative, not just a transient artifact of racing with the summation
> loop.  Any reader in mm_stat_show() will busy-loop across all possible
> CPUs with zram->dev_lock held until the writer runs, and a higher-priority
> SCHED_FIFO reader on the same CPU as the preempted writer will never yield
> via cond_resched(), livelocking the CPU.

I high prio mm_stats reader is an unlikely scnerio, but yes, okay.

> Clamping negative sums to 0 in a single pass (like
> percpu_counter_sum_positive()) and moving zram_stat_add() before
> slot_unlock() would avoid the unbounded loop.

I disliked the clamping approach when I looked at it.  But thinking
about it more, I think it is the right thing to do.  It's perfectly
legal for zram to return 0 for those dynamic stats: no data stored,
no incompressible pages, no same-filled pages, no slot-free, etc.
So userspace should not be surprised to occasionally see zeroes for
those stats.
