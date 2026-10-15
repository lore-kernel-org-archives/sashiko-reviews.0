Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C723559CBD
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085468; cv=none; b=qp6RqWWSrdr7/uw5Ok3zQzxldLreXmnoFIFpIXQOjdZE901knM+2c0KS22p6zYw3tl8fSw0W+qYsVLzkhCh9LePwC13jBhOB3rr5ENbn+yqpiw17ctRgnSjoJNO+TCJmnA6jNZuN9OJjYJebHXdMlH2EWkeXihvOEL22RBzBObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085468; c=relaxed/simple;
	bh=+6qqVI+UWHsu25cea9ZmYLujgZ7WSoMAKrVCzT4/W/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsNOjHYk5QJAAMZw6r36xkSt1F1dOOleU+1VZ4wIgU24KNJHC1m+kun9KGAAzGdQrbXb1u9qXfjt8s3Esm4UD+nKdEj1NnY9oKOrhpW+dtmVwR/pENM9vErYfnkqMWoBWs4Rd9QCi7LpgMRijJJ/+fE8oXafExi6ZCuPbq1YChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ri0RCbQ4; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ri0RCbQ4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-930c0f9c1b1so587758885a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792085457; x=1792690257; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rSU3k+XuYVS+a9J9Tl+KuvJO6amav+IGeClFbopt0w4=;
        b=Ri0RCbQ4KRwyD572+CsdovEU1eIHx9yNZlihYLmQMk9LTTka+/Cs8HYstj1Lv8zfIU
         rpZuwJF1PTnjUx+HCz08L4RcrVDguwOwgzm9/KBj2Hbdr64DSKeuoDgkxw4afYyK24BT
         Iuam/C1KSa9bMfPIAJmPq29futynJENN8vEI5Wanyo34QBX4hWbBjfVgo89hdDeroPpK
         pkz7Pm1U7BA/zsmuSJxPJNiRQkhjyT3/d/lYAlC3BdQMI9Y/C5lMoJZGZCk1CDWOgP/Y
         PhG1OGZltOX6HZdw2n8RKuROcnbVGwE8j5RxVs7Qo2QC8zMou6QdhfIMyTnXm3co2t3+
         zCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085457; x=1792690257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rSU3k+XuYVS+a9J9Tl+KuvJO6amav+IGeClFbopt0w4=;
        b=x+8Dk52L29A+pU+Ird40My3LYCsfiSOO9xSo6YodPl27bLHd1XraR5nIOfsi7+q66A
         QFtamVY5ovIZGnS3B1fgd85ScT768bxq0+KejI9gH4KfNGZpBejjcpzhC6vd607Wt9+i
         Mk1fPyp7r3S2CO6khWRZr5xPnvrbnBWlLHGVmcicunOT+IgqaqNYseGYviNoQfXpa91p
         1Ygp8nlsTWvEHaIU7tFHXQ4zWhAm4aUqZNf1QLi4BJFwbosX67pszcUlO6Lxua6lWxq1
         qKKmubWzgo45TWNwgQOvKv+NO8N8cPMqJ6LycRwjWQ4w/5QQ1YlKd8ppRTDFj/cYo1Mk
         huZQ==
X-Gm-Message-State: AFq9FYIyUfzNeRnaqYUOhb9Wjqx2pQ9oT8aSPYmBOkdX5VNYtd9w/mAc
	n29YOyWUeV9XKJ+0KYreJA0tMy2sqzzUccxm5fvJ4uSPMfk3IOsHgHuWat8v9vp6pY8=
X-Gm-Gg: AYBFou1ms6xHi3l1MKCydPaoYTAOlJy6Be3TgZCA0nvjqzN/FWpS1KfXbXKWPwwxz2F
	PlWTa+jxKofYai7ulgEHRqhPDfaaHRCNE+p1efc6ue9X8kHSH2IaEGQFO4fJyOZRTTeQp5YQOCy
	zArPhHvvecOaQm/6M/5eKXiIXTiEMx4QM7ke2kq6J9qj3D7WbCfAg2frlp04Hp7KN8FV6Lu8W8a
	Q2qOpl1bur45SXvMbyrUwUZYzu+6Sf63+jr0X7K9ywco6w6buBrUC/gkorXNGqg2zcojcitskm2
	8b9mUu9xpR9XaR0f2jQbvVkl8uwduhUo/bFVSlztQCvJszMKcFCN2QyxyUDudjAkELt9lvKqP2B
	xHqmXzi1hSI0BNcedeG3/yisAsWeqzKd6wiOrwnrmMaW+SbTGRF7/7YQwBpl/03O/n0uETrEy5Z
	9COv3FgYiaTZ3RFDhFoeGAPFrRlmdwHxHfP7tR2s6PLIlNXQTsBUQ9DQv90Lz3Zk8QOJg49/3dR
	b6LKroP9F8FogpEZwPRgG+gBhZG/6l+uISHlmY7OiFS46kI1Y+ftA1T
X-Received: by 2002:a05:620a:4115:b0:93e:6c02:d181 with SMTP id af79cd13be357-93ebd1e23aamr3396316485a.14.1792085456943;
        Thu, 15 Oct 2026 10:30:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb1af26sm745476d6.33.2026.10.15.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:30:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPI7-0000000H5Tx-0ACq;
	Thu, 15 Oct 2026 14:30:55 -0300
Date: Thu, 15 Oct 2026 14:30:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Davis <eric.davis@broadcom.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next 05/13] RDMA/core: extended address handle
 attributes
Message-ID: <20261015173055.GT14213@ziepe.ca>
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-5-a0e626117113@broadcom.com>
 <sashiko-outbox-172008@kernel.org>
 <CAMouMYL6cw6uNMnd_Vjz5WnWypTq7iq-YXHhyk14_taBJhwuug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMouMYL6cw6uNMnd_Vjz5WnWypTq7iq-YXHhyk14_taBJhwuug@mail.gmail.com>

On Thu, Oct 15, 2026 at 09:15:56AM -0700, Eric Davis wrote:
> On Wed, Oct 14, 2026 at 3:50 PM <sashiko-bot@kernel.org> wrote:
> > Should this use uverbs_copy_from_or_zero() instead, to properly support
> > trailing zeros and allow future structure extensions?
> 
> Agreed, I will fix this in v2. Patch 7's JOB_ADDR_INSERT handler reads the same
> struct ib_uverbs_ah_attr_ex the same way. v2 will fix both.

Please go through all the uapi stuff and make sure it uses new
mechanisms and helpers all over. If this was written a while ago it is
probably out of date.

Jason
