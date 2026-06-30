Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD9B34751E
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818164; cv=none; b=Xn23ApCaMX9s7Eqzt03hhk7lM5vUN4I7XQBTZRu67foRsliAvwO+L9DO1wwojkWV80hTVxkPbBlQ3t4fMmvvLyQtgU7xnoMfBacez3As2Qv3drOhDj34fe+MqwVIuKZFszOaj4s6PV+QgIfx/4VGCEYejJ3i6y6IOwMVIB80K+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818164; c=relaxed/simple;
	bh=aZtOcJQEs3HeA6J5ZhXO3LIiRB522Qn7mauZCnQEyGI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=F1DoCiDncwVwH5MGNMbdFtabr27ZJQvpL4dPPuU+rvMDcxPH1gT17MylhONFjkEyE74V44aAqEPOZcJQroaZUAfhotKIg7L89wK/XRUnlQzaC4r0O4WK8xIH2lQq+9k+o13xBzBSjluUHFatpteIXocvfJhKvWXFeCvIYMVVYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=tSH21SUf; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="tSH21SUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782818160; bh=gyqfkTLrC6kduqPSVXaxDqy1JRHoGg4HTQ/Xtx9D1OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tSH21SUf877HKM3nl4vDw/uvDEVS8pElISt5BhX797O2Oham8HzfXPnNg6VfobEPw
	 IbPUQWzAo9cJHmdC0DlnW8pvsMte8VdPSn8QV3uzuwMzWhx1D4yLVutL9uySrIDl6x
	 uP3/O3ljzbcaTSnMgM0NpXiL3uTs0rftJfUNc3Ho=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 3ABBB8EE; Tue, 30 Jun 2026 19:14:43 +0800
X-QQ-mid: xmsmtpt1782818083t01f49fsd
Message-ID: <tencent_94C3BFC44F9761376546C493608362896E05@qq.com>
X-QQ-XMAILINFO: Nx5J06Esz7r7xbYMHuFPJJR67lhKId4a74qy8RLwQpfc9eLqmmxkaIlif2mxU0
	 y5jvZVjn20x0Yk8tg2OrRLVvw7LFykBaSBEWFm8pRq71WQhWf39m53PXvD6gms/yr54UhKrI8ZUk
	 ind/KSi5Kt/cv5vvqh6Imn76DhM1PqFxHRbW3WvfiIUhnh5yp5ysyfvEZjIGnVlrYjs6YgPICBBD
	 3wAHH6HigA87siexD9lwqlPrzbvb9WpKVNkn0Huq0y4CteKH3dQ8mPn+u3JMx8xOETFXV5GTK1eZ
	 OgBEWI9TRAJ1m840KlmvoS87CyEWNh9QQprfZEXhFIsPCtwGXMrxgkp7UPAjo2d+YgTvO1KEnFhx
	 jKhY9ix8i4GdXEmiCkHKu1veTWpANsMf4XXKiZds+iCkIYAtOAcvt2Qe2+nufQnvBIk6AnEUIavS
	 R5io8ocfGfpvdKcmDIWMPImqBG9dQcC49+Igw5eA98py+0tOF9iyN4vgeiTCGSP4umCDyt5ISoyY
	 8SMlRLyGAg/5Z/KOT7QSXbldl4toH9vogoDNSOHksIvy9xq9XIVDhxK+jLnKgOgTmwpeGMDU7nHV
	 Gg08/1+eghIb66uS264YjCRNwSJ1qH/0ppqG8hN+o6XewXhK92oqZ2ngR0ny5e3RLrXCyKOeiZ1a
	 Ew65vPZWsbfR2M1Q7Er3/Nl0c7C8ztsr8yZlobX9ZR0nCFCAEkpcEwhmQuidQJBG/5JU7sMkROvz
	 SvfXdVVDR989vrDysGwqh+jkAn5ZxwVq3Hqh6M0dv7I4gFtQsZwvL+e6HKf2/b1QOjcliVqUhJ/6
	 dcpJHZDzjl9ZeDF1cK29MKSdGfrBKEmUQ3bhIf1QeN8ztdaENUK8TyZxYVTJ8dw9osZp5aHDjZJM
	 /T0DPUqlTRFVbXQwNZTzzwkZ2Hy/gVeMrak8EqD0wktZjZoNFGQZ2dPcZj7bK+yFvkHPWV3tA9jr
	 gddq55CE5JsBMijjaJbeQcZHHzWeEtqKhPl+KMKg+YR5BllqgMYcRYciQoLVVsMiJ7Rbuv5ovJTi
	 lk1GCMB7VnE1wL5g5t
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	eadavis@qq.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2] bpf: Fix smp_processor_id() call trace for preemptible kernels
Date: Tue, 30 Jun 2026 19:14:43 +0800
X-OQ-MSGID: <20260630111442.947614-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630094823.897BD1F00A3D@smtp.kernel.org>
References: <20260630094823.897BD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 30 Jun 2026 09:48:23 +0000, Sashiko wrote:
> [Severity: High]
> Does this fix the issue at the right layer? By adding the preemption
> protection here, it masks the fact that the caller is running with migration
> enabled, which leaves sibling APIs vulnerable.
> 
> For example, in __rhtab_map_lookup_and_delete_batch() in
> kernel/bpf/hashtab.c, the batch loop iterates and calls rhtab_delete_elem()
> without disabling migration.
> 
> If the map elements contain special fields (like BPF_KPTR),
> rhtab_delete_elem() will first call rhtab_check_and_free_fields(), which
> eventually calls bpf_mem_free().
> 
> Since bpf_mem_free() also uses this_cpu_ptr() without get_cpu() protection:
> 
> kernel/bpf/memalloc.c:bpf_mem_free() {
>     ...
>     unit_free(this_cpu_ptr(ma->caches)->cache + idx, ptr);
>     ...
> }
> 
> Will this result in the exact same BUG being triggered on that path? Should
> the missing migration protection be added to
> __rhtab_map_lookup_and_delete_batch() instead of modifying the allocator
> here?

Like this?

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 9f394e1aa2e8..7b98c2eea685 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -3345,8 +3345,10 @@ static int __rhtab_map_lookup_and_delete_batch(struct bpf_map *map,
 	}
 
 	if (do_delete) {
+		get_cpu();
 		for (i = 0; i < total; i++)
 			rhtab_delete_elem(rhtab, del_elems[i], NULL, 0);
+		put_cpu();
 	}
 
 	rcu_read_unlock();

