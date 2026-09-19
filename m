Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDB0346E63
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789840313; cv=none; b=rqzY7sPQnRw/ipKFuDY8y/Fxl0AnAWClxLCe9PvGuEOhy06dObWVCJQWJ8G3CZjM8HJ426Ur03nLpID1Aqvmy1W88BcvhN4w8dskq+DBENiMGAQpq+syQMHWjFqC9UJQsCYo3fbWsQADw+GEMhOU1EqvFcGFqbNW37RlSfGEg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789840313; c=relaxed/simple;
	bh=q/hBOL5VhvukiO8I9fQFxJcxHhYRSYJ+tAl9JV7bFow=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PKbSm7M2/Sir+VqT2qvtOO103wJhoLslxclUo6LlgkISyGnuJhDiAi6UPiqD/maIWIJe8ilbToyguJUYvYJxzIR9md1GKeJ7koVfC085SxZZ5sOLoAgJdzjG0FTUyXMnoKi+q5MsizxXTICpp7ITR8oeLmp+zs2bGOy3djFf0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5iBPSlx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5iBPSlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18F31F000FF;
	Sat, 19 Sep 2026 17:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789840312;
	bh=k9ei/PjC+XV2hruw6wBA4HnhJrHSGFx7FJobsi+5n1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D5iBPSlxCGLi55JA+8OC55wMs+CnTUNk6M6TsO0JwVqMIGfA8HQUUOK1vzl39tiN7
	 xq7k2dnm1YLKZaolNSeM89w/9Ae2HOoa8m56daMwNksshozLmkrY+kM7RVbY47UunW
	 Vrs6lcdJ8R9IG9FVXHGKLfSJZxD7frpftM4YgyEIY7n06nFA7jO8aOJXch/afb6Haj
	 8GWVockeH0zkadRaO1gsCI2/mH8lgyJnNCmBbunjkPIWUcBglL0WIGuEIUF4ilSOLd
	 5tsGd8l6QtdIREo+lxtGF7/Wnes87yQcOjSH1bI6tck7JfZQ1VhgSau6p0D1kqv0bX
	 oaRQtlTjpmKgQ==
Date: Sat, 19 Sep 2026 10:51:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net-next 1/6] net: lwtunnel: change encap fill order
Message-ID: <20260919105151.7d8e2b2a@kernel.org>
In-Reply-To: <aqznjquXIavzmuFD@fedora>
References: <20260917-ynl_rt_encap-v1-0-fbbe6e680571@kylinos.cn>
	<20260917-ynl_rt_encap-v1-1-fbbe6e680571@kylinos.cn>
	<20260918063655.418681F000FF@smtp.kernel.org>
	<aqznjquXIavzmuFD@fedora>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 15:26:06 +0800 Hangbin Liu wrote:
> > Does this leave an orphaned attribute in the buffer on the fallback path?
> > 
> > If ops->fill_encap is unsupported, it evaluates to -EOPNOTSUPP and execution
> > jumps to nla_put_failure:
> > 
> > net/core/lwtunnel.c:lwtunnel_fill_encap() {
> > ...
> > nla_put_failure:
> > 	nla_nest_cancel(skb, nest);
> > 
> > 	return (ret == -EOPNOTSUPP ? 0 : ret);
> > }
> > 
> > Because nla_put_u16() was moved before nla_nest_start_noflag(),
> > nla_nest_cancel() only unwinds the buffer up to the start of the nest.
> > This leaves the encap_type_attr orphaned in the skb payload.
> > 
> > Since the function returns 0 (success) in the -EOPNOTSUPP case, the caller
> > is prevented from discarding the message, which results in a malformed
> > netlink message being sent to userspace.
> > 
> > Could we record the skb tail pointer before nla_put_u16() and restore it on
> > failure, or is there another preferred way to unwind the encap_type_attr?  
> 
> I'd like to add a checking
> 
> 	if (likely(ops && ops->fill_encap)) {
> 		ret = nla_put_u16(skb, encap_type_attr, lwtstate->type);
> 		if (ret)
> 			return ret;
> 	}
> 
> to cover the EOPNOTSUPP issue. For other errors, the netlink fill will abort
> directly. What do you think?

Sorry, the email landed in the wrong inbox (due to lack of CC)
so I don't see the full context, but from memory - makes sense I think
