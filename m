Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF80754DADC
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085418; cv=none; b=gpODXwZwUvAB+WEc9IYVUube2pCMo3LPMKCDOUESmGTwpFBwbDNxsWJ+EhaO3I8Zxi5/yVBN7DOXwQJrHBDP2SEOuinyHL4hCgGGyyvwgjxDDYfYKeZfKqa+IOqh4w1Td5FrjYCw3M9/NeabpMSzdeFbOwicMhoPfeOiHadXSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085418; c=relaxed/simple;
	bh=a3qw7FpOix6g/wGV5bXQ1nW64xCim7gqGsQjoN0BNjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYlPwH2swhSuatF6YIqhwpEemzTTePgrAl5uHZhM1KwWx7l1/e0M5RzcAsZMetE2uUSrJczSGFzbf3EjHfybUirMOL7YLj0edifrV5IL6/yzXDca+3ODExlqcw8Nd8xEAC4bHY/FyONBjs9i7YsnWFhuFBfpH2OYlxd4Vmz6AxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=il+1YLhq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="il+1YLhq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9178d514951so14706956d6.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792085408; x=1792690208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a3qw7FpOix6g/wGV5bXQ1nW64xCim7gqGsQjoN0BNjE=;
        b=il+1YLhqVlOAjbe90m/Ln+U28ICZckmHtesuWbm9po4tOnojCfxXUDU29X9IsvW6Oi
         HNynb1BX1afREQAaFyUdQB+JM5XfgE1h33giZTDCNdN8VhVX+2tmPukklRMmnYatUc6X
         BxVnsEUTCgSN2mLcO9phje/q5qBywVAEVqtHWfN7iSYTmakJW9khoe6r+aWgdmqXmtUK
         PV2epYPCVoxeUzPxRk2snVHAnlBrwDTVpmU9akTh4hAt/j0mPM/6DAxIuxXO3mUzvbZW
         VXiw7Dohu6bA3dFRd5Ob9235b1AlyEvd2U6XffHGfcdhXc+LHPETzP/5j+oImPJuf04P
         EhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085408; x=1792690208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3qw7FpOix6g/wGV5bXQ1nW64xCim7gqGsQjoN0BNjE=;
        b=lEgMUR/OdSg0UvTbr5eDoalU4ioCt3fxvfDk2SNY/yv44vZkUKoX2FnHCPdEb3ZLjS
         sjjmLpx/JKO+dfoRFqQHFU8IFwvAafRH1kX1iZXrabkleelR5tGcjvjCW5y5eAf2HZjv
         PkJLqHRpYB09ITPctlOy4214uxXKeRzeSpr/9k4Dbc4KNNrKHGTg5n4CZPWPY4KgUK9g
         t+KcZQK8Ql9kajJv8/Oa7OkuMwP0BqJgum5abjMinRQzCPTAuSIj6PFHKmf5Gcr+vP0G
         s46Otx+fAEEm5YOeWFMYus144R+/pLTuh2RaQolpFFfnN43wfn/Npm/jDT6l+kH7JMYO
         HlSg==
X-Gm-Message-State: AFq9FYIPiVhtOKVFCdHXcJPr2o8AVzWR9l/empIx29xzPygItG99l7b3
	zctDjGkYVz7QFgec8FOgnyJgHCrhRPzpeAsipe4RPLqWjwYdyaLgIloJ4z5/8ovEWKO5qFwf/F7
	evIPC
X-Gm-Gg: AYBFou3sK6YVNmJBO55kBFG+yeOlj6qo+c0t4sfw3BIIY7IoJdgTuehw3ZOGMxwCIJO
	n+J76AGlHzMotaLKoEkEGv/Ff2rumuT8XK6RU7ZH5H3aD0FnzQ+Oe09FMFDH1cn0cpl7++boYdR
	ahC1Fbsdwp/thfq0/vt4ETfC/80MGVSL86SS+uWIXchqn1VyIJ6JQ+IH4GSez29TiEGlR9QCvTP
	MHeS8x2N3zuGrrP8t+RQoqpd0ERqzOvKle4XgQLyhOMhhuS0QZaDUFRs6HgY7KeiHNZiDSvu+An
	kI2bUSELFYMyQCs2pg3YOaMyc5LBnUUBwV2Fu2brwyU7nRRB6snkSIIuXoWfp5dcuvi9njN/P7Z
	4GAi9jzgrCam29od8Nc0/yD4p5ZQGg10KhqjiAueCee9hkiNRMzSL9yyfIsQMJpd+XK6oPmZgRz
	416QSN0R/XmQhQubRS6nkrZAHGuJVPde91QKcccVG/BtOBwysRbfzK9dmZ8CqN8URDRsD7quXDH
	wD2215RpNLLPtnGmjLmJXkKlFevSUyD3vQ38ve7etue+hz86qUpbKLX
X-Received: by 2002:a05:6214:268e:b0:917:a8ae:26d6 with SMTP id 6a1803df08f44-91b5557f525mr339715216d6.34.1792085408413;
        Thu, 15 Oct 2026 10:30:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb80515sm646736d6.44.2026.10.15.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:30:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPHJ-0000000H5RJ-36Dw;
	Thu, 15 Oct 2026 14:30:05 -0300
Date: Thu, 15 Oct 2026 14:30:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Davis <eric.davis@broadcom.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next 04/13] RDMA/core: add the reliable unconnected
 queue pair type
Message-ID: <20261015173005.GS14213@ziepe.ca>
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-4-a0e626117113@broadcom.com>
 <sashiko-outbox-172001@kernel.org>
 <CAMouMYKADaQjsjeGZZyB+eWvswpf+b_H=aT-VZHVoe=vQFhxZA@mail.gmail.com>
 <CAMouMYKo+z70vA86P5gG-Kz=5TCSUZVfuLS1wAaCLKopze=R=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMouMYKo+z70vA86P5gG-Kz=5TCSUZVfuLS1wAaCLKopze=R=Q@mail.gmail.com>

On Thu, Oct 15, 2026 at 09:09:20AM -0700, Eric Davis wrote:
> If it's preferred, v2 can make both post commands return -EOPNOTSUPP for an
> IB_QPT_RU QP so that is explicit. Let me know.

I didn't try to undertsand all this ai output, but as a general
comment if things are not supported please return EOPNOTSUPP rather
than pretending success.

Jason
