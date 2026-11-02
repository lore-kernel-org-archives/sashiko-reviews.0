Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624570;
	b=0mILPDDZgOjJiy9ZOZfEcVCGnlw4SSQzitIWgFBs0rPDObx3C0GKIa9N4gNH2gyLsNEO
	 VoKymP0da2Jz0QcA881UbUXHWC72gQU4aidCqyZl23xcYIf69WUWqWz+Cz7sXRXdNfbBh
	 1x26NVU7tjz6tc9cAlAMMTRA0ok9nxYyHRYH+/jzrJFcx9W+zr4WHvk2pAI6f06LXhz56
	 qX8b2qPDYPb6wTX5WOLUyNl7y869ZlaEGPxZc9ZdwL/BMu+S6CHXIzTZYyLhsoU7eHP6U
	 F85QfMeWFppUDYIKMLuk7mJxS2NoTJetYq7Abh7/0zu88AH+iM250UxjakrAYh8d0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
	b=mPpPyMWCVzZNkJv5lyvYtFP56pVs3EZIRpsff/lFUSGthbBHOyt1BRvORiR34eMiwdKR
	 LH+ZfbfyrwSFK4i9W4IlodRoGkUKuNbD/6Y2NPaqIEsEiGGtuhQjE9qjX0bCsbT1TAOuH
	 Yg31cUO8Qo3hAeiNO/uwtNBSeCU8oQ+YMBI44I8GQKi3Qb3dxiCD66epvwzjsf+VAK727
	 kr0sohByOP7NSr0A7VzhjchjJhJ6cTcv7/Iunna6kC7LwBRHYtRRm95jhhJ7ugvM4z6Uh
	 3EHyoquWKvEbnAYJPmZhcmnd6zXAgucLevOptqB6vzYQR5Jho0Zk5FDo1/CUJm0rPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXZQrCS4;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F559606A33B
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 13:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F559606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXZQrCS4
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e538951d07so29853365ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624569; x=1794229369; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=MXZQrCS4oXbXK27ulr3ClLkpGodWa/M5IuwjzHq4WidCAtA18GM7CfaBYaBPPQptrN
         PgJGqPGRydyNvVk3ot6Q1WN4C2OtLVOI4fQHdZcmGkMGfWUcGw0Qlux+V1O1Mu6O+t/n
         cbYZDyJWE1UdXa9eQFOAREMzUt15cKHD61QMhh+PhkE+vraKy6/3PWns/RQc/rnKZIta
         8nX4DD39WhoDbLpp5hC2PydL77QQuzs/9EOr9Mjn0yCJ++P36hSQFORzSNF21l/TMWln
         HVdsu9QZ3UokCNAYo44gXho0yGxprGp65P/PdF5smuxDyW8++vLJk/PSqqprB9Ia40rL
         8HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624569; x=1794229369;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rVghLVE5+gMoBZCIIvb0ZQoGty/hiEa5No/b+jM194=;
        b=0ZEhk7JdjxNUKSLuhAhYDW36FtzXRf0J7HBxc7e+1Zp049+mCebxfNY3Nq24K4cN5H
         uv6yNp0TVV1ksEYmapEtb1STbEkm1FjeYAIO7bgZuLTj31WV5aP0p6OYjmQHebzwhV0b
         Wl3RB40MzGYCa1fcmOJZqxXki2QhvolrciVKNfwWfgbz4++A+ZOiGOkKhp26wNhe4fRQ
         3+HFjJ6HDc/kF1gBFv409JTgEI2Ypv4pkX28CsZh0+euQvA0ebDu5O1bkvEqwWtSSgdu
         DmSJxMVnXdhtHHBIEBhooOdGTukYUJKRL5XAUzVvJbQdrY2tQMPhgPEKDfqQBM7pETuU
         xl/g==
X-Forwarded-Encrypted: i=1; AKwUvByj6CvwPXAIlIxxiH/pqnB0KQb9R5KB5E1N0+5KDN6yI2qne3q94D1U3Hu52uSK5mI16JIKu+3T0/ZoT6P8+nM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9EyDSxxyXmQqx3xjT86sP5Vi44EyRbB4Hrt+JEfHu5YZmLiLP3
	u/9UMJK1KOxYgt0vRs6URIWg/PheOci4U64Hgi61ZK/+f0G4mDVfpY3x
X-Gm-Gg: AYBFou3mS1pVV8a5Owjei38kxiCCYPsFAiGhKK+CyNZgX+dQVb1YZ6sz7T/31FbajV+
	fqH2LTGoY1HmEPU1OjHe5UGiHrC34pAhOo1iJpqI8Qx8YZNtMP7/bVmpB92VOrcWqtj8VWJg3YD
	gD675AzZ9GIZMF8aJIFbcKJlgcMwRh5ui9SDn7WFHFIfABSCAikpaqQ8VcHaf83Al38PMr3LTnm
	jbNGxx4hOlZwBZo+eiQE1+zQi46v551kF2Q/qIkJ7mmkH1Kv/EfgiIF9SINmpIggxrbtj1Avqd3
	MRdWevgaM1zIoaYNZ6FuI3AtZ7KzO5bbr/2vwMnjeBNHP5jw9AMVm3/wOQg276WDu01vKqWeqKU
	TsF1JWZ6eWOF7adSMqnEUD1LQ3asu2juJzQnPZE+x8+SoSoylO3pw/QlgYBBQbGUF0LFYlTFQFY
	W6iVn3QhHyGAeISGgGyOV6iO7jtJqwWZ1baHBIGyBeCctBgJkvmJd5uVn4rU6SkiwkDxOsty+JI
	ZZCEqMulYA/IRB35NGvRda+Oe6CLQWah4RipD3/ijOk7zzPCSpz8qVNO4QpWBrFLmGPncO/fqu2
	DJnDf5JZC+zt31jWp0xdjO/PEMB27JK/qbnclhvfh8CcOl8v5bgaOMVt6ylXsPtBGTBgYAVZcRY
	fxX4oqBQYuMhAnrlJ8oB0yQG2kDMQTJA/ssTGk8g9l42mRNvlUzPbEGc=
X-Received: by 2002:a17:902:db01:b0:2e9:8b2f:3561 with SMTP id d9443c01a7336-2eb3650034amr96629035ad.54.1793624569079;
        Mon, 02 Nov 2026 05:02:49 -0800 (PST)
Received: from [10.131.7.109] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm27542985ad.25.2026.11.02.05.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:02:48 -0800 (PST)
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
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 02 Nov 2026 23:23:28 +1100
Message-Id: <179362220860.2958105.9509793190720553695.b4-reply@b4>
To: Jason Gunthorpe <jgg@ziepe.ca>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Felix Kuehling <Felix.Kuehling@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Danilo Krummrich <dakr@kernel.org>, 
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 dri-devel@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, Christoph Hellwig <hch@lst.de>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Honglei Huang <honghuan@amd.com>, Jann Horn <jannh@google.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Matthew Brost <matthew.brost@intel.com>, Michal Hocko <mhocko@suse.com>, 
 Nico Pache <nico.pache@linux.dev>, nouveau@lists.freedesktop.org, 
 Pedro Falcato <pfalcato@suse.de>, Philip Yang <Philip.Yang@amd.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Simona Vetter <simona@ffwll.ch>, 
 Shuah Khan <skhan@linuxfoundation.org>, Sunil Khatri <sunil.khatri@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Zi Yan <ziy@nvidia.com>
In-Reply-To: <179352350180.2.12918668886938034091.b4-reply@b4>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
 <179352350180.2.12918668886938034091.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi all,

On Sun, 01 Nov 2026 19:58:21 +1100 Aveline Noir wrote:

> Oh, I missed that. I'll try to fix it.

While working on this, I found that the fix reaches well beyond
mm/hmm.c and would likely need rework in several subsystems, so I'd
like to hear your views before going further. v1 shouldn't be applied
as is.

amdkfd holds svms->lock and prange->migrate_mutex across
hmm_range_fault(), and svm_migrate_to_ram() needs both, so it can't
migrate the page for the validating task. Migrating under those locks
can deadlock, since do_swap_page() waits for the device page lock, which
a concurrent CPU fault can hold while waiting for svms->lock. From
reading the code, amdkfd also maps such read-only pages writable today,
as it takes GPU write permission from the VMA rather than from
HMM_PFN_WRITE, so GPU writes after fork() would be visible to the child.
I haven't been able to confirm this on hardware.

One option I tried is an opt-in HMM flag that returns -EDEADLK and the
page address instead of faulting, so amdkfd can drop its locks, fault
the page and validate again. It works with test_hmm, but the amdkfd
side grew to about 550 lines across the GPU fault handler, the restore
worker and svm_range_set_attr(), and is only compile-tested. Read-only
entries also come from NUMA hinting scans and mprotect(), so pages that
aren't shared would be moved out of VRAM too, and Xe and nouveau would
see their pages migrated in the same cases.

Would you prefer an opt-in interface like this, a change to the amdkfd
locking so that migrate_to_ram() can run during validation, or
something else? I can post the amdkfd part as an RFC if that helps.

I also found a few smaller related issues, and I'll send fixes for them
separately.

Thanks,
Aveline Noir
