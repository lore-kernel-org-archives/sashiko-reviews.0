Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0916374186
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778969106; cv=none; b=rrtJS/lslWVjzEJiGxEU3rIgpGIvtEAJXbn7mxtch5zIiCCBsjwB23jIlRTNvpPvDXP/+fsYVP/I5gjxNGot1D1MIsVh1quB5uC7YSt3xXi9zm+ZsRUX788qsuVKfId/19Q6pCRWAp7PPvHDi9z9woWBnvBgaOWJ7RaFm1LpxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778969106; c=relaxed/simple;
	bh=zYIl+qz7G2t/DzlRbO/QBttRJX1uUt1lVnONNZPF9HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLMNG+Y9xvUUZMsHRP6Tq5cP8QlCYWQ+6bRatZbqgOJrJ6UtQSknh7chEhJ8nRNoTxTXqZdYTR2EXJLJB1F06e7+12F7yLXbMhGYgcfnSxRr5MAwYzE/yk6BP2jax+MaPrarsevXtnPN7rwtk/TOmZH4ZKG7Ckozfx9Q+uh4Row=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=zUb+V4C0; arc=none smtp.client-ip=61.135.153.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="zUb+V4C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1778969101;
	bh=Jy9ahS+BHqG75wogZN5Y6lXx4PExc2rGGex7c/TQ2Zs=;
	h=From:Subject:Date:Message-ID;
	b=zUb+V4C0UNKj/SRwMqY5Y5w3peKkv500hScPLXnp4NurNf7Msx0AlpqLjtkH9pFZX
	 jty7NAZtJOJ8Z0s4eXSJh9c9OiFw40DjYirflnyTKwDYUUMnhbQzitGgzIMPL6Qee9
	 poqiBw13aMWxEDRCBVU/+T/UczrTR9iuvJCdaYEA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.32) with ESMTP
	id 6A08EA0000005A8C; Sat, 17 May 2026 06:04:49 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8816344456600
X-SMAIL-UIID: D7E886744C4B498CA0360549BEC3498D-20260517-060449-1
From: Hillf Danton <hdanton@sina.com>
To: Theodore Tso <tytso@mit.edu>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Stop false review statements
Date: Sun, 17 May 2026 06:04:36 +0800
Message-ID: <20260516220439.738-1-hdanton@sina.com>
In-Reply-To: <20260516204143.GB26730@macsyma-wired.lan>
References: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org> <FA45D2AD-1135-4480-8423-63C0D37FE78D@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 16 May 2026 16:41:43 -0400 Theodore Tso wrote:
> On Sat, May 16, 2026 at 12:15:12PM -0700, Roman Gushchin wrote:
> > > The trouble is that subsystem is mailing list, thus I still got all of
> > > them via b4, which is used to get the discussion.
> > > 
> > > Send them only to the maintainer, for example. Or maintainer + authors.
> > > 
> > > Basically the same as LKP is doing.
> > 
> > There are subsystems which want email reviews to be sent to the subsystem
> > mailing list. In fact, all currently configured email policies came from maintainers,
> > I don’t push anything based on my own preferences.
> 
> In the case of ext4, we have a weekly video conference of the core
> developers, and last week I asked the ext4 core developers whether we
> should start cc'ing the linux-ext4 list.  When I first asked Roman to
> send the reviews to the me as the reviewer and the patch author, I
> didn't want to cc the list in the case people would find annoying.
> 
> The discussion in our video chat was that the quality of the reviews
> was quite good, and the only feedback from the ext4 developers was (a)
> pre-existing problems that were unrelated the patch series, (b)
> sometimes the problems that was pointed out are ones that we don't
> care about (for example, there was a recent comment about readahead
> detection being racy, and that was not ext4-specific, and readahead is
> a hint and if two processes are reading the file at the same
> time.... oh cares how the system handles the hueristic of something
> which is a hint anyway), and (c) while Shashiko is good at pointing
> out problems, its suggestted solutions aren't as good.
> 
> But that's OK, on the whole, the Sashiko is finding problems that
> humans very familiar with code base had missed.

Feel free to add why. In over 80% or just a couple cases a week?

> And so it's certainly better than most human reviewers.
>
Only ext4 specific? In the past 6 months?

> Based on that, the consensus of the ext4 core developers that it would
> be better to make sure that the linux-ext4 list should be cc'ed.  So
> that's a decision that didn't come from me as the ext4 maintainer, but
> after consulting with core ext4 developers and reviewers.
> 
> > I agree, it’s sometimes gets tricky when a patchset is sent to
> > multiple mailing lists, which policy to apply.
> 
> What I would suggest is that if we have a patch which is cc'ed to say,
> linux-xfs, linux-ext4, and linux-fsdevel, as well as a dozen
> developers suggested by get_maintainer.pl, and only the ext4 list has
> requested the reviews, then only send it to the ext4 maintainer, the
> ext4 mailing list, and the patch author.  The Sashiko review doesn't
> need to be cc'ed to the other lists, or the dozen or so other
> maintainers.
> 
> Cheers,
> 
> 					- Ted
> 
