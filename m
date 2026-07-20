Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA98382F1E;
	Mon, 20 Jul 2026 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561588; cv=none; b=YcFRK6qfWMJL04Yy4y+SRlLaCAESmmUCVOYYVUDY4AezQTcJ8Slr8ub2APGrkU6lz/LmzfWvSw2joDsKSI0M52VjDR52myhV8My28SGQ8Bz2urkP9M74jlXwguOjjW9dcPQLWKxMu2giyODk3NGaCY6j8jDsGxiiGEMBYtQL9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561588; c=relaxed/simple;
	bh=MdEidk9nIB5NgOaJbgLZkCVAJJML0aPZe1hsF4VcjGE=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=QVfgypBQ0JV5PH+hkjqEXRCNpxgT+9ectRTv8b/d+I1dhJ8hgkhYgHLCaS37Ds2NLgbAwEX/+GXePvsVS5QB4IpIZLizgVeSmpTRqmWs1aFrhVvWcvy0xULzRZCXelI3nhqBTSYjhChipOTUzxPYrLK26ov5XlEiqvzLdikjVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hNqv+J9V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hNqv+J9V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FEC1F00A3A;
	Mon, 20 Jul 2026 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784561584;
	bh=huCagZh3bkI7bPAtjbQPbTCWcunnj/sybzismqiqG3o=;
	h=Subject:To:Cc:From:Date;
	b=hNqv+J9VYUYXWGG5vSivfJd/UY1feKhjQVY8ssdaumxYpFVEFz20l5tBD2HtEd6z5
	 ta3uw0UwoTj1AMr2e/+IfAXmMLwc52bhSCtSyo6Sgz+SXHsvYlVy3TbfCOVJ6hFWgG
	 vA7sz06lGYaegw6aVzTgmRlVOwfpRYn62fnLqpVE=
Subject: Patch "can: bcm: add missing rcu list annotations and operations" has been added to the 6.1-stable tree
To: gregkh@linuxfoundation.org,mkl@pengutronix.de,sashiko-reviews@lists.linux.dev,socketcan@hartkopp.net,stable@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2026 17:24:17 +0200
Message-ID: <2026072017-handclap-exploring-2059@gregkh>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    can: bcm: add missing rcu list annotations and operations

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     can-bcm-add-missing-rcu-list-annotations-and-operations.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7b2c3eabc4dafc062a25e10711154f2107526a78 Mon Sep 17 00:00:00 2001
From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Tue, 14 Jul 2026 18:55:27 +0200
Subject: can: bcm: add missing rcu list annotations and operations

From: Oliver Hartkopp <socketcan@hartkopp.net>

commit 7b2c3eabc4dafc062a25e10711154f2107526a78 upstream.

sashiko-bot remarked the missing use of list_add_rcu() in
bcm_[rx|tx]_setup() to have a proper initialized bcm_op structure
when bcm_proc_show() traverses the bcm_op's under rcu_read_lock().

To cover all initial settings of the bcm_op's the list_add_rcu() calls
are moved to the end of the setup code.

While at it, also fix the mirroring removal side: bcm_release() called
bcm_remove_op() - which frees the op via call_rcu() - on ops that were
still linked in bo->tx_ops/bo->rx_ops, without list_del_rcu() first.
Unlink each op with list_del_rcu() before handing it to bcm_remove_op(),
matching the existing pattern in bcm_delete_tx_op()/bcm_delete_rx_op().

Reported-by: sashiko-reviews@lists.linux.dev
Closes: https://lore.kernel.org/linux-can/20260610094654.A1FFE1F00893@smtp.kernel.org/
Fixes: dac5e6249159 ("can: bcm: add missing rcu read protection for procfs content")
Signed-off-by: Oliver Hartkopp <socketcan@hartkopp.net>
Link: https://patch.msgid.link/20260714-bcm_fixes-v15-5-562f7e3e42da@hartkopp.net
Cc: stable@kernel.org
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/can/bcm.c |   25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

--- a/net/can/bcm.c
+++ b/net/can/bcm.c
@@ -248,7 +248,7 @@ static int bcm_proc_show(struct seq_file
 			   (reduction == 100) ? "near " : "", reduction);
 	}
 
-	list_for_each_entry(op, &bo->tx_ops, list) {
+	list_for_each_entry_rcu(op, &bo->tx_ops, list) {
 
 		seq_printf(m, "tx_op: %03X %s ", op->can_id,
 			   bcm_proc_getifname(net, ifname, op->ifindex));
@@ -903,6 +903,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 	struct bcm_sock *bo = bcm_sk(sk);
 	struct bcm_op *op;
 	struct canfd_frame *cf;
+	bool add_op_to_list = false;
 	unsigned int i;
 	int err;
 
@@ -1045,8 +1046,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 		hrtimer_init(&op->thrtimer, CLOCK_MONOTONIC,
 			     HRTIMER_MODE_REL_SOFT);
 
-		/* add this bcm_op to the list of the tx_ops */
-		list_add(&op->list, &bo->tx_ops);
+		add_op_to_list = true;
 
 	} /* if ((op = bcm_find_op(&bo->tx_ops, msg_head->can_id, ifindex))) */
 
@@ -1068,6 +1068,10 @@ static int bcm_tx_setup(struct bcm_msg_h
 		op->flags |= TX_ANNOUNCE;
 	}
 
+	/* add this bcm_op to the list of the tx_ops? */
+	if (add_op_to_list)
+		list_add_rcu(&op->list, &bo->tx_ops);
+
 	if (op->flags & TX_ANNOUNCE)
 		bcm_can_tx(op);
 
@@ -1211,9 +1215,6 @@ static int bcm_rx_setup(struct bcm_msg_h
 			     HRTIMER_MODE_REL_SOFT);
 		op->thrtimer.function = bcm_rx_thr_handler;
 
-		/* add this bcm_op to the list of the rx_ops */
-		list_add(&op->list, &bo->rx_ops);
-
 		/* call can_rx_register() */
 		do_rx_register = 1;
 
@@ -1292,10 +1293,12 @@ static int bcm_rx_setup(struct bcm_msg_h
 					      bcm_rx_handler, op, "bcm", sk);
 		if (err) {
 			/* this bcm rx op is broken -> remove it */
-			list_del_rcu(&op->list);
 			bcm_remove_op(op);
 			return err;
 		}
+
+		/* add this bcm_op to the list of the rx_ops */
+		list_add_rcu(&op->list, &bo->rx_ops);
 	}
 
 	return msg_head->nframes * op->cfsiz + MHSIZ;
@@ -1625,8 +1628,10 @@ static int bcm_release(struct socket *so
 		remove_proc_entry(bo->procname, net->can.bcmproc_dir);
 #endif /* CONFIG_PROC_FS */
 
-	list_for_each_entry_safe(op, next, &bo->tx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->tx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
 		/*
@@ -1657,8 +1662,10 @@ static int bcm_release(struct socket *so
 
 	synchronize_rcu();
 
-	list_for_each_entry_safe(op, next, &bo->rx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	/* remove device reference */
 	if (bo->bound) {


Patches currently in stable-queue which might be from socketcan@hartkopp.net are

queue-6.1/can-bcm-defer-rx_op-deallocation-to-workqueue-to-fix-thrtimer-uaf.patch
queue-6.1/can-isotp-use-unconditional-synchronize_rcu-in-isotp_release.patch
queue-6.1/can-bcm-fix-lockless-bound-ifindex-race-and-silent-rx_setup-failure.patch
queue-6.1/can-bcm-add-missing-rcu-list-annotations-and-operations.patch
