Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D14EBAFC
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166447; cv=none; b=glk+J/7VFXVznP/b32EDBq+vBFSZHGeGOnRFxDvTunF5BVwzGi9qLDZ21+1mK/yqAZBsypJYjDMUeAg+7WCV5lqtjfTR1rmhawzfMm++0XFiOAxS3JOEkEm8tclqLgNpjiLVy2A5MLw9f9IE3/5USELGE14UkQOj/rGIo7qPL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166447; c=relaxed/simple;
	bh=4y3egpqOY/nZk+J0/RYz4bR21HyXzVScWN2wyjhJufs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p3GKuvE2UKzBF5elNh4xFl6ImqiKaiX4DKRDN1G3kp/UT1Pi4lyJzRQxMAf9TnhuHKnwQv3NFgtss8OhfFBQC/KVTslQPpkDRt23X5lQIhAS5w1KXkcnIC+HTEGfiycFA20DhMt/FpWPRXB916BBiFzk45mw2X6fdwuTucKapPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHaMlyDM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHaMlyDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792166443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dl4M40l9nHxXIvI25ccoxXnkcqQS9fDj14w2LQVggOo=;
	b=gHaMlyDMVMr8BjRu9sUFFMxZwd1LEWpkkiqv3tZIsx8cvuTCNPmAJ3l9tpYFyqeltsS1eL
	mofSYkywiSVeHO8zWU2AR4YYoj83RBqby10mB/boyNWX9FnKdWqG1KTiJDyyK8eKkn9iL0
	em9SQMKWhZ1QLpD0mpdbWug+tqqvPgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-8tqWFYt9PVSYxy5xaimEag-1; Fri, 16 Oct 2026 16:00:41 +0000
X-MC-Unique: 8tqWFYt9PVSYxy5xaimEag-1
X-Mimecast-MFC-AGG-ID: 8tqWFYt9PVSYxy5xaimEag_1792166440
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1d6db1d9eso905795e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 09:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166440; x=1792771240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dl4M40l9nHxXIvI25ccoxXnkcqQS9fDj14w2LQVggOo=;
        b=Q7rLJQS8Bkl2CXvezZ66jN8t9vWjjvTdClzOYgv8Gd0DQOcMJHdRvZpCek0QyPEWtf
         yWdB7fKk3SFlrNWR1bwGBFk+QcQbXW2Ut05UU2SSIsaw64ySBsvkJsNagE8LewQg6bsC
         37bU0NqRbu18IZh4wCBjXF6Alw/mr2hDIFYLnqOa1CuxnG6bx0u02+7tWs8uJ9rPN9DP
         AI97Ho/4l9LO4Xmyxe3UwHjI/TahoNZpRr2czeoTQsAU0UJLu19vhkMOKqcpeFU4MKYY
         mTNZDfyAjv1wbHrfnK/m81NwT9OCfujmk6Xj/3bUq+c/UC6Lslyfx1CIR09Lk7DOw7W1
         5dhw==
X-Gm-Message-State: AFq9FYKRmwBvdKSkm6El82kriSQIVsddLFCwpP56z2qi0tdIpol9nePt
	Cpm812DDQZVTqEHoQPO7BBWKg2aLXcZIZbHgaDCDgaF5WKlQbKNORaGQriKKIsOOZp3ZGFAF6+j
	RM3+cSfSbPizLJ3dZri5366sFqlhak8iiLdcLKWATAKAUawDMyoT1rhrvVDluQx+nDReKJUj1b3
	AKniOduTSpDWU4pXctaBxhnb6KC2VxLVmQ/lVqt8OwpZnRXIBmOiPDpg==
X-Gm-Gg: AYBFou20edLn819tdyRV5dhI4ucpZEg1wOz5C4SujMo27qX7qDrRh539tbjnYBujgj9
	U3MjQeZ6Hh9+7QXbE+QwUUMsiepIbF+YwhhkX1MlONCIYMvuM7h9KhUPBabIP9Tq/HBt8T0pPcR
	Amc7Qms6FYqhjVy0GHr1TswrsIpcAqcjy+nfxNsd5SUkdPYIV2uJNs09h8xTgsrBlJF1Sk7hiax
	ztx+Ht5bs4vaaq9qxZO1xsWs7G7aEQDkGubKjTWPAqhmRCt6pYvGGVmSFA5ONpneg7LeehRMc8s
	RcariSU5GKMT+sJxQ+XPXI9CDRnyCgLGWzNBsDKUv8n016wP108aSptVLm3WmzvRE4/1/PhpVDs
	qmKRtcA==
X-Received: by 2002:a05:600c:64c5:b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1d7603dddmr5402495e9.17.1792166440243;
        Fri, 16 Oct 2026 09:00:40 -0700 (PDT)
X-Received: by 2002:a05:600c:64c5:b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1d7603dddmr5401715e9.17.1792166439696;
        Fri, 16 Oct 2026 09:00:39 -0700 (PDT)
Received: from storniolo-redhat ([130.25.253.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm70020225e9.2.2026.10.16.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:00:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 18:00:36 +0200
From: Filippo Storniolo <fstornio@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Oliver Hartkopp <socketcan@hartkopp.net>, linux-can@vger.kernel.org
Subject: Re: [PATCH can-next v3 3/3] can: add can diag interface
Message-ID: <atJHPuFD8dZyoDaj@storniolo-redhat>
References: <20260904-feat-can-diag-v3-0-bdcebf07b373@redhat.com>
 <20260904-feat-can-diag-v3-3-bdcebf07b373@redhat.com>
 <20260904142606.6FB371F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260904142606.6FB371F00A3D@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bQENAabAQsNwXIGrkcN5tyeXN2Mam8sksltAsDcjU9k_1792166440
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 02:26:05PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] Index-based resumption in can_diag_dump() causes skipped or repeated sockets without notifying userspace via NLM_F_DUMP_INTR.
>--
>
>commit 8ae9bc3a24d9d75317a64a778b0ca0dc88c6a32a
>Author: Filippo Storniolo <fstornio@redhat.com>
>
>can: add can diag interface
>
>Add the can_diag interface for querying sockets from userspace. The ss(8)
>tool can use this interface to list open sockets. The userspace ABI includes
>netlink request and response structs with socket information fields.
>
>> diff --git a/net/can/diag.c b/net/can/diag.c
>> new file mode 100644
>> index 0000000000000..647a94636a548
>> --- /dev/null
>> +++ b/net/can/diag.c
>
>[ ... ]
>
>> +static int can_diag_dump(struct sk_buff *skb, struct netlink_callback *cb)
>> +{
>> +	int num = 0, s_num = cb->args[0];
>> +	struct can_diag_req *req;
>> +	struct net *net;
>> +	struct sock *sk;
>> +
>> +	net = sock_net(skb->sk);
>> +	req = nlmsg_data(cb->nlh);
>> +
>> +	lock_can_diag_mutex(net);
>> +	sk_for_each(sk, &net->can.sklist) {
>> +		if (num < s_num)
>> +			goto next;
>> +
>> +		if (sk_diag_fill(sk, skb, req,
>
>[Severity: Medium]
>Will this simple index-based resumption (num < s_num) cause skipped or
>repeated sockets without notifying userspace if the list is modified between
>dump iterations?
>
>A netlink dump of CAN sockets can require multiple messages, forcing
>can_diag_dump() to return and resume later. If a concurrent thread creates
>or destroys a CAN socket, altering the layout of net->can.sklist while the
>mutex is dropped, iteration by index becomes inaccurate.
>
>According to the Netlink uAPI guidelines, if iteration during a dump may skip
>or repeat objects, NLM_F_DUMP_INTR must be set on the affected messages. This
>is normally implemented by maintaining a generation counter and recording it
>in cb->seq to detect list modifications.
>
>> +				 sk_user_ns(NETLINK_CB(cb->skb).sk),
>> +				 NETLINK_CB(cb->skb).portid,
>> +				 cb->nlh->nlmsg_seq, NLM_F_MULTI,
>> +				 sock_i_ino(sk)) < 0)
>> +			goto done;
>> +next:
>> +		num++;
>> +	}
>> +done:
>> +	unlock_can_diag_mutex(net);
>> +	cb->args[0] = num;
>> +
>> +	return skb->len;
>> +}
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260904-feat-can-diag-v3-0-bdcebf07b373@redhat.com?part=3
>

I understand the concern, but as far as I can tell no other diag
handler implements this.  Does it make sense to add it only here rather
than as a follow-up done uniformly across all the diag handlers?

@Marc Kleine-Budde @Oliver Hartkopp what do you think about this?
If you think it could be worth adding this feature, I can do a respin.

Best regards,
Filippo

