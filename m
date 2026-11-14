Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641745;
	b=fiehgGpvTSZ/TOi0vEiDA87A1KYQIuQgT2LUbxZDtqS8YCkIJLTtYfZojyuu3xtakMY1
	 zU7k76UlJReXXt3wKLrcocLTfMrdOOEUsr+h0LkogxKrw5hlXQVw5SD0eFhO89Zzv71jt
	 O0KPFyZdG9Qlb0aU9PaM0b7tIJucd4eG+UsMg7OuypSwX9AvcbN0eLkHtF7SrsZAxzWGE
	 6JW3YIW1IVGcc83MhPp4p8i1HqHc8cCGF7GRREdAsuh9IrLCfS++gbIvWzOAy8Tuz3vSJ
	 PIqqPM9ODaCtZIEy2/SQGEmOlDdBliX1o5cwpNx1lBpQ4TaiCuU0iw8fj9TmZc1gCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer;
	bh=cahiVRSoQzf74nfMrEDmS6N07dyHDuJ9YLLjX1noXVU=;
	b=KsEFQWzAKQa8amRtZRSCYcey3Q4OBh/nuxVFT9np/hFOM4/SNvYM2lD2NHK4scuy/J3n
	 4vNS8s5mn87JRJ8rDhauA/DQwiIwHHhRSHA84+xkGOa236fSTjPCyFgB97jIUQDj8b0tT
	 XNIXb2tbzcjMDmxYEBOdGJLh7gTYKYtGEKHooeGYOt7uXXQScoa64CkYXDD4OyQHcmSBU
	 Anb5SytLJqIdz6xwDcTo6LqJRIcDOjHVpC8hcedStcrdBgRELyFdB9TAKDvWV52OqnyQd
	 CeY38Utsx2mPSCnUdfi1hsVqrseKSyaQHYbhh6polAZfJGmXZEFqtGZuQ+dvRIIv+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tSU35aXT;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D420606A32D
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 07:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D420606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=tSU35aXT
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-930c0f9c1b1so273335085a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 23:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794641744; x=1795246544; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cahiVRSoQzf74nfMrEDmS6N07dyHDuJ9YLLjX1noXVU=;
        b=tSU35aXTDWiEq0X7N1tL4mDTJxEJYLDODeZVwV6x79sI6Hwo6C+0h3c6BIUmJzjNdO
         TAwAEgcdl+hl2jNDUGgzkTg7l35B4OAwOEolcD/1lrXMyGpqjuvGiSJXvjg5aGLJPm5g
         0zFEFDeJ4c+JpezfBJRPIMpvz25e/B721nt2jkshJmI23hHPjUD3Dtk+ZsKxrrQtIIIS
         0G6yl/sywbjJqGJgXYjuw7hA9OZYJ9I2G7AtzIz2lgcLKrXQt8sXvojuN+uFYdFhpxsb
         iJIGe8oRt+jXxc2qS2tlGZMuJg3g9G7GiEs+tX/H1YA+SAxoJY5+KnKfIQtxryvmQZsw
         zhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641744; x=1795246544;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cahiVRSoQzf74nfMrEDmS6N07dyHDuJ9YLLjX1noXVU=;
        b=kZHhdhxGiaZfmkgEMfWUZF1HqChefVOo+IrSklZn3wwJhBT9JxOaqzSrcPT1KIabUO
         CzHu8HXe68jkUFM9BsjEo9+DZayuLtDdo5daDzz6k+k9A8tzg66+oMxlUb9wvnK+JuSL
         ZFDJNh6eDgCG+WFUD2/Le0zN7A+dW8tuZ8SqdWUvTnl6+U5AYZjJU4bkK6uz9M3T5dLd
         JrvTLVxZx5+VyfvYR1SWc8lixiZwniAV4jM5mQQegq9YP0TzGkNS6TWUBNWObruejmZT
         5N0CmgD8hsYmNr9wtIMvOW8v04pLJ3czSMbtALId24KWGu0lPBCHntkn1+pnAnHWOroX
         PQvg==
X-Gm-Message-State: APuU4Z9303YMIyOpHWwCiyZ+iGccnbVgF/5ovgUZi/rTuE6WGvRtRwC6
	6r5k9afXUvH52kwW6QcZ1esk7qdw8V4iJbm1MEMNCPvAcLiekwgs4uw1KDyB5XArwXY=
X-Gm-Gg: AYBFou2xk2ew+8oCt4/e+PEl88BHFWGY/0zRBt40sjNABnV/UWMM0aT00zSGaPv6N22
	5oDJsb+nBHaWLiBz7j5i9N2KCXv0fDxvrq3kGjHLyWVbZ8PTCbbT6CVs+Z+htCroD5s1j7pShA+
	niS9J5ktoCfmYTZIuFqJSeAmnUWhbeQdfuBs2rorALSV7XQbX78UPh46hLbiivK2H1Q4OOTXmFq
	3OjpqRYwPLOtdbmdCw7cyujsTw/qx7G1DjziBSnL50q0FIcI/+sqWiUpSIdqPJE8qfHpWxkBODL
	gAqJQln5tRkIFUARDQPC/MAVfjkAlw5PDTlel+xTr+3tQXQMjLq6akLfhzgSWheKBsKCcKx9RBJ
	rkyZAN6UJOiybUIcJaPc4EsSfkeSRMqbdnjVAyQwWVvMqAXvcJwO+GQm3RiMRz1Uw+eqK39ckj1
	B2os6s5+lkeOG6yV9d64QS6rwhFzutRh4vRa4rc31YsoI8m6MF3OYxsMks1qTQSmW2LfbAPEcir
	ON0XE1zkH8lP3yml+62mWtYu9OUIpIl7tKzXfG8f1+BwSgXm9s9fMZw7qMGj5BLjyYxblJNbZvp
	FAuzUm/d+R/a1EvFyn09RGfQaWAVoaXUe/C9WO8XLtOXL5tuA2STDAIRSBvebNMp2kQaRMq++ro
	WeezPIzc=
X-Received: by 2002:a05:620a:a00c:b0:949:6193:acc5 with SMTP id af79cd13be357-9496193b1f6mr334016685a.74.1794641743958;
        Fri, 13 Nov 2026 23:35:43 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803ad1sm357502785a.12.2026.11.13.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:35:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 10/22] mm/khugepaged: restrict collapse to common
 memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 kernel-team@meta.com, linux-serial@vger.kernel.org, damon@lists.linux.dev, 
 linux-cxl@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
 dakr@kernel.org, johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <sashiko-outbox-214261@kernel.org>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-11-gourry@gourry.net>
 <sashiko-outbox-214261@kernel.org>
Date: Sat, 14 Nov 2026 02:35:42 -0500
Message-Id: <179464174225.482102.14033958474429517565.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-14 07:21 +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 4bbe319ef86fa..b4bd29f25c145 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> 
> [ ... ]
> 
> > @@ -2741,6 +2741,12 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
> >  			break;
> >  		}
> >  
> > +		if (unlikely(!folio_is_common_memory(folio))) {
> > +			result = SCAN_PAGE_NULL;
> > +			failed_pfn = folio_pfn(folio);
> > +			folio_put(folio);
> > +			break;
> > +		}
> >  		node = folio_nid(folio);
> >  		if (collapse_scan_abort(node, cc)) {
> >  			result = SCAN_SCAN_ABORT;
> 
> [Severity: Medium]
> Should collapse_file() also check folio_is_common_memory(folio) after
> locking each folio, matching __collapse_huge_page_isolate()?
> 
> collapse_scan_file() drops its folio reference on each iteration and
> skips missing page-cache indices and swapped-out shmem entries, and
> collapse_single_pmd() drops mmap_read_lock() before calling
> collapse_pmd() -> collapse_file().  Folios that are faulted into holes,
> migrated, or instantiated by shmem_get_folio() or
> page_cache_sync_readahead() on a node outside N_MEMORY_COMMON after the
> pre-scan will still be isolated and collapsed by collapse_file().


Ah, this is technically a pre-mature report, as this is an unreachable
condition at this state in the series.

I do already have this handled in a phase 3 commit where private memory
becomes migratable, but i suppose this check could be moved ahead just
for cleanliness.

--

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index fac314b89a234..7a69d6e9b42bb 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2390,6 +2390,12 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
                        goto out_unlock;
                }

+               /* Migration may have moved the folio since the scan. */
+               if (unlikely(!folio_is_common_memory(folio))) {
+                       result = SCAN_PAGE_NULL;
+                       goto out_unlock;
+               }
+
                if (!is_shmem && (folio_test_dirty(folio) ||
                                  folio_test_writeback(folio))) {
                        /*

-- 
~Gregory

