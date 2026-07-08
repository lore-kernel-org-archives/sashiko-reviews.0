Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F3361DBC
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 19:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537688; cv=none; b=NGngtwG1pSRJwdHwNj5W75n9EeHUVO9+rhX/7L36QI37BDBE/ERund8LhD+p5csqUbJCR4jFM4H4dUSCpEv3Sq6VyfLb7oJpOfdK47uveGxvl3E2Q1OUaNAGgMxlJvL9u8IUzpWMlNC0OaS/E/oq2fp3CgwNjfF7lZeuprGmTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537688; c=relaxed/simple;
	bh=O+SHbqxHYQC8VxshMXjN6PL9jbF/R0Dv0W4W10nvn8o=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KVJgDYd9Oi7fqVA2uli0dFrnoJwARfvA6HMr1SAMV/YVcE8Z7VDlh7jU3Ja8ISQn8JfJr93W8qRmxpyd3uZlsTX4S8XIxb5PGtIY+LMoYdI/hzThgegADfe1/Y93OLAH+iE11FBVOrAqUpLKZLBlGPwjd+0l/4Ri76PtLNy559U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=d4wt5CdV; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="d4wt5CdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783537675; bh=5XLPie9r6+yl64m5zncEatY5NJEwwH77uQPfsZNs3Fw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4wt5CdVkB44ToycHZEdnnfTjKkgcFmJbmkammreJJP4svH/xwS1eHE00TYk/DdFu
	 N/PT2t3mAGoYkxOeKKViG7UOs9nU3mhvDQsdlBvZXZt6T2uAmMnX95vkznhykC/Xdw
	 4oTeWFESMKhfupDJkK9qqxKBCghcKrMb9tsp262U=
Received: from ubuntu.. ([218.196.207.7])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1F509A15; Thu, 09 Jul 2026 03:07:53 +0800
X-QQ-mid: xmsmtpt1783537673tspacyl5w
Message-ID: <tencent_A06E37104031E554163C3B8AAA9E8A214308@qq.com>
X-QQ-XMAILINFO: OFpInORavztRE6iKFGesoihR/eqA1XKS4Or1KQCb0cYrlqTBBOkHw1FiaU0rZ3
	 4TDFgQ/8W78bnuVh5L8A5rb1nTAzW1J8LfmMUPRrCLQQmk3x3xpfX6KG+p3/BHxJceWTMr40jmh3
	 TL0NUogZGs+uLWWVcr26M5tERxFlwdZAQTaowXdpYHGyjVtHIY0Vrubiwzp5h3aNlmtH6KrsM4v0
	 ghxRiV1d+NHNwsxVZZcLR/EfHnt95nbh8kJCUxyy/hPepKjN2QOe1fKPXLLi95VStox2lnRd5J7+
	 J5puqmh9ljvr4YYUX9LKN8FbNgtILPXISs72gSzHWWbId2Eg+3PaGA8C+9aQ+wSonRSqpfispbbk
	 8bW8V0JEHiPpS1o14bpmvk0AswaYSdV6FHj+WxljQvdaTRZFeaQP2nW4PBRxkOwI3kZvVVVbbzh8
	 JdgN7nUPOy8+an3JDHOxQ0TLKO2PwFBihsIriBV/mLk1ArTVzwVbxdW7jznIxZSibad++x/cT/mA
	 6Z+LI6KJjvgysbj/yF6JjUA1Hg77mUhHJMrfvcAuAH6zbpdZGzkX20CApLQn2H/J346/jtptrYMI
	 ac2I5Uv5OahIC/RTX6FqkcbwNYtn4k9R62yYXCYHp6Wx2Ei6PlyV1kAj5H1g1h3HQkwtsv+tSlOp
	 8FhN+Gqt0qHJHzSb5shMjcYBHzsaZdj+sESmrZ9cLXAD4aPE1i5n0WrwwTD0JbBf2LOnxJZY47uE
	 X/WK4Uj9+uTYt1sAPah9lSgwdxAEnA1ZoSuihjYg6CeQESudlTuWHRoUEEw2BQiKxhuIbdM9qqsx
	 itANoKVwk5N3Ngdp3F5vkrOjcGoep4UkVLnnY/671uTUyNCa/8j75OrXHn6yfkUHuZPPtcORyvQb
	 2TN9zo5TMff/WLGtdYhIkgfu9R364y1iMYQFp5u0w6k2tQ7lu4ux90DW5d1ji5ZPeSj0AJi7SSAY
	 UQy717bTLD7puFCFCWwvunJQWJKg740SXsNq593cSxjUnf+dGaiMwVeqa3eDkB4avRsFJPwfvtsO
	 0iuzJ8jHaRbTKjlqfK8Drj+LR2mhbAjcJFCCFgJw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Guanghui Yang <3497809730@qq.com>
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu,
	Guanghui Yang <3497809730@qq.com>
Subject: Re: [PATCH] ext4: clear error before retrying inode xattr space fallback
Date: Wed,  8 Jul 2026 19:07:52 +0000
X-OQ-MSGID: <20260708190752.1038939-1-3497809730@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708131836.EBB751F000E9@smtp.kernel.org>
References: <tencent_192F8A699EFD21126E02101131C9546F3C08@qq.com> <20260708131836.EBB751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the review.

I think the "dead code" comment is based on the older v6.8 code path.
In v6.8, the retry label re-ran xattr_check_inode() and overwrote
error before the free-space check.  In current mainline, that assignment
is no longer present on this path.

In current mainline ext4_expand_extra_isize_ea(), after
ext4_xattr_make_inode_space() returns -ENOSPC, the fallback sets
new_extra_isize to s_min_extra_isize and jumps back to retry.  If the
retry then finds enough ibody free space, it can jump directly to the
shift label.  Without clearing error before the retry, the stale
-ENOSPC from ext4_xattr_make_inode_space() is still returned even though
i_extra_isize has just been updated.

So the added assignment is intended to clear only that stale error before
the fallback retry:

	error = 0;
	goto retry;

The partial fallback to s_min_extra_isize is pre-existing behavior.  This
patch does not introduce that semantic; it only makes the
ext4_xattr_make_inode_space() -ENOSPC fallback consistent with the
existing fallback path above it, which can also retry with
s_min_extra_isize and return success.

For the data-loss concern, ext4_xattr_move_to_block() calls
ext4_xattr_block_set() before removing the ibody xattr.  The ibody entry
is removed only after ext4_xattr_block_set() succeeds:

	error = ext4_xattr_block_set(handle, inode, &i, bs);
	if (error)
		goto out;

	/* Remove the chosen entry from the inode */
	i.value = NULL;
	i.value_len = 0;
	error = ext4_xattr_ibody_set(handle, inode, &i, is);

So if ext4_xattr_block_set() fails, this function returns before removing
the ibody xattr.

Thanks,
Guanghui

