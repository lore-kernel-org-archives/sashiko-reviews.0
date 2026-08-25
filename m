Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0637D11A
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644739; cv=none; b=Pygi9NuaPsnAhV/NJgeRNJwR34xAsvofGjhT4d+obTVwNIRwIjkQjsPauU3dhDmiZI+b3d8iPincDVX7MMlG+3lEiJR0I4gZTtr8oibwGyzoYhKpxyZxBZ0fgkO8iVeRd++goq0G+na6L+Ayhg1gKpy4ybVNIQZQpf6N8gpANrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644739; c=relaxed/simple;
	bh=s3x3RNU/eA7uy/SJ1qUVWhAw0EVi7d4DWm+cDdSIGDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WquqOoSbhM9iv8Y6M/M/OJYaMGwbaaKdme+DEGCAcZoQWAQx7hk7pfIobl01VBkvaIlyQkr+zrKEh13h2+LQRHWI2+AvL0A9vH6fDUE6oZpfS5tr9ObFeqkZ87/oiF0GCReKjwmdbj9bt2uoNfWFoxPhKixVroEGCoR/8WkeLgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMFn/Rmg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMFn/Rmg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d530328efbso38303525ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787644738; x=1788249538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCxIjrQYLQM8XDCQ4pvIySM2CoxYiO6JYpvvBpStof4=;
        b=HMFn/Rmgrdcwz6Y2ew7QVbRZX+Foymntko9yzy25VV54lq6rq9X1ErXcB1MZeRd4bs
         td4cnkY9i9ciVhXdpgZbJuuswaPbN0aBwAInhbXgZTP7V4DAxCRU/fk8vdXTYqs+B6II
         nFhFKirGAV8Qm4q2VQX+W2XTZaBmbc3sB+anwEztOFKJQzKgZOM1JSIr1JfACdlX41iv
         bco/e9on1pH/ubqzAxGeQL9t6s1MnLzqH1jl+gQACOf+9uVb/5a0S4d2zWscHBtF6CLj
         Ozwxgq/G1J58cBVpIo04Cc+dFhXG4+fV2CNGk/t1I4pnja+SWxSF3ZYSxXgLrMhoVovm
         crkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644738; x=1788249538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCxIjrQYLQM8XDCQ4pvIySM2CoxYiO6JYpvvBpStof4=;
        b=LIqRZvUsF7hYlcTew0uLe5j1cA33ZMYtDKPD2UrCGvN7LtnUjSUIY0Z5D775Rs+UYi
         Nj3TXOSL0pUN887Rb6c+771MXa5gucaycXl/UojK1sO1xIYFCRq4Fa6RIgv0B77Vgiqp
         DoJkjT2YJMC8wdMmYWhfjvUOlGuFKQIcCnqGdZAvtISfAnCrFdtpGf5V+n+3KyNs2qf2
         332S9X9H/pnpEPHoHPXXP6LGGL4e8fThorNHPwNT2JkIBF9dDjP7fe61Afuxz7n3CGdU
         Fn2D+CFo0Jk4PkMdFZ3pk3s9Xm5F14PALrPx+eG5lBnZuXFg7MHl7sYstdOBseena1WI
         /ttA==
X-Gm-Message-State: AFuF++nP/G4NOrSHUGvEnNvhuUNB1iozfwYJv5ipDaPAhMhgFFHdbyOK
	4jXV9uVzJtinR/HTcIiCWpmlzlghpFEttR+4mlRAuvEJMs+0YPWTtD3ZDBdhhMnz
X-Gm-Gg: AR+sD1037L+ovsetK35JzaA3NprWuiD2k2uyCNxAuIA14w9dC5fvsmNeUc9+OdscSJz
	fv+iuRDUKw9V4G+Su1kmXgvs4q6TtmTyNts7/tS/u/KuyeYzoZy7IWVF95vQ/+OGC6eoawEwg99
	uvfI1FpUSJMOW4L8WeoICG2e5MV1mE6xTKBqnQg+LCYRDR90FbvAX2hXmGQ7Q0H4ZYweXKiKmqs
	rV7gWIDiqsLE5G2lgJDt1mP7y/ZsLwmjGmxw5WYkb46VQwL544/TrASsP9r/tcTDO94TEXPp7sg
	19ZeITDZFF7sq4E5sMfZazfK+6SdHObjilTGWFdnxZ03g8m0+1McXImFzavxxvsjyPz+vbE5rc0
	hrnWwJY79WqeqSaGCs614MqnMwzl418Dh0eChO0sfoPa8CArlzvo5a53Exmr73ypuEwJDPQURqp
	sm7ooi5GHvC8wlS426F2m4l/Mg7bPgFaCIj1l/YdLSwhXo7X8ZOkMedXqrFCTMcOrmHhk/B8HP5
	8/sNqNVVvM=
X-Received: by 2002:a17:90b:4a81:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-395c33ec558mr55513154a91.7.1787644737768;
        Tue, 25 Aug 2026 00:58:57 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3282525562dsm6041392eec.31.2026.08.25.00.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:58:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-ext4@vger.kernel.org,
	tytso@mit.edu
Subject: Re: [PATCH] ext4: skip extra isize expansion while unmounting
Date: Tue, 25 Aug 2026 13:28:36 +0530
Message-ID: <20260825075836.2693545-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260824100141.86E351F000E9@smtp.kernel.org>
References: <20260824094512.2436628-1-hemanth.selam@gmail.com> <20260824100141.86E351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 24, 2026 at 10:01:41AM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug introduced by this patch, but does checking s_root here
> without synchronization leave a race open during unmount?

The s_root test is advisory, like the SB_ACTIVE test next to it, and the
patch does not change that.  The race you describe is the
check-then-dereference inside ext4_xattr_inode_create() itself, between
the s_root == NULL test and the inode->i_sb->s_root->d_inode dereference
eleven lines below it.  That predates this patch and is untouched by it.

What the patch changes is how often that code is reached.  Without it,
anything that dirties an inode after shrink_dcache_for_umount() has
cleared s_root and before SB_ACTIVE is cleared walks into
ext4_xattr_block_set() and hits the warning.  That is the path syzbot
reproduces, and there the caller is the unmounting task itself - iput() of
a lazytime inode - so no second thread is involved.  With the patch those
callers get -EBUSY first, so the window your scenario needs gets smaller
rather than larger.

Of the two workers: ext4_ea_inode_work() only iput()s EA inodes, which
carry no in-body xattrs, so it never reaches
ext4_xattr_inode_lookup_create().  ext4_end_io_rsv_work() does reach
ext4_mark_inode_dirty() via ext4_convert_unwritten_extents() and is only
flushed in ext4_put_super(), so it can run in that window - and with this
patch it gets -EBUSY there too.

> Or if s_root is cleared right before the warning check inside
> ext4_xattr_inode_create(), wouldn't we still hit the original warning?

Yes, and it returns -EINVAL exactly as it does today.  The patch removes
the deterministic path syzbot found, not that check.  Flushing
rsv_conversion_wq and s_ea_inode_work before shrink_dcache_for_umount()
would close the rest; I can send that separately if it is wanted.

Thanks,
Hemanth
