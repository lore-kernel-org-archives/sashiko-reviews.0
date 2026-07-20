Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DD42DA4C;
	Mon, 20 Jul 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561862; cv=none; b=d+zfdb69jNxntRvV/CYqFW7TZnzE1JMeJn7Cz+YejeeT3YjtdVm4JkqAinlUUUTAObgOav6MMox1bkSm0mspNKMrSD8q47svDJvrI+9Gsfvos2FpGj1ikb+I2EZNwIUzT0nhYvXj4joFErkOMfKK8Obo9RRFoq+IhWcaoYx7Pcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561862; c=relaxed/simple;
	bh=230YduhXIwJAKHVikMxqkumcyKGaNnXBMyUUiZK098Y=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=qBK9S0ruj8dMSXgMGhar355JkoP3nSJ1ArYxZ6dOd5ppINBKvfzNl6WLFtdt/lD8YFYxHXaKoPIHw2Wwsri3hKGe9gm/mG12Sk+TSl6uc5ZQ4w+LQxxkLt7vfdWhKvAJ7G5jqyWSnOFCpr44y5NvJ9bx3EMENOiRoFT9nuJwD/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K0cw+n0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K0cw+n0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7277E1F000E9;
	Mon, 20 Jul 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784561861;
	bh=Qq4hgaE3QORwBrHf3eTNO6oOK8a/4QCzfnlSgyq71dg=;
	h=Subject:To:Cc:From:Date;
	b=K0cw+n0uAV6XRxiqneN8Na65htmll3vPAvehoXhnS+nJBMdtkMhyReSAZ6kwC0Ygv
	 s4KcS2vN+s2/IH9thCnxwA4Fek7Ghvn1RvxDY3QQwxAhNnNVVizLYmENJx58k2fJVm
	 r5jKzvp67nF3XPV3FnXNSUTLsbgEP6zDPrGovguU=
Subject: Patch "can: bcm: add missing rcu list annotations and operations" has been added to the 5.10-stable tree
To: gregkh@linuxfoundation.org,mkl@pengutronix.de,sashiko-reviews@lists.linux.dev,socketcan@hartkopp.net,stable@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2026 17:25:44 +0200
Message-ID: <2026072044-unfrosted-extended-3102@gregkh>
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

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     can-bcm-add-missing-rcu-list-annotations-and-operations.patch
and it can be found in the queue-5.10 subdirectory.

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
@@ -244,7 +244,7 @@ static int bcm_proc_show(struct seq_file
 			   (reduction == 100) ? "near " : "", reduction);
 	}
 
-	list_for_each_entry(op, &bo->tx_ops, list) {
+	list_for_each_entry_rcu(op, &bo->tx_ops, list) {
 
 		seq_printf(m, "tx_op: %03X %s ", op->can_id,
 			   bcm_proc_getifname(net, ifname, op->ifindex));
@@ -877,6 +877,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 	struct bcm_sock *bo = bcm_sk(sk);
 	struct bcm_op *op;
 	struct canfd_frame *cf;
+	bool add_op_to_list = false;
 	unsigned int i;
 	int err;
 
@@ -1018,8 +1019,7 @@ static int bcm_tx_setup(struct bcm_msg_h
 		hrtimer_init(&op->thrtimer, CLOCK_MONOTONIC,
 			     HRTIMER_MODE_REL_SOFT);
 
-		/* add this bcm_op to the list of the tx_ops */
-		list_add(&op->list, &bo->tx_ops);
+		add_op_to_list = true;
 
 	} /* if ((op = bcm_find_op(&bo->tx_ops, msg_head->can_id, ifindex))) */
 
@@ -1041,6 +1041,10 @@ static int bcm_tx_setup(struct bcm_msg_h
 		op->flags |= TX_ANNOUNCE;
 	}
 
+	/* add this bcm_op to the list of the tx_ops? */
+	if (add_op_to_list)
+		list_add_rcu(&op->list, &bo->tx_ops);
+
 	if (op->flags & TX_ANNOUNCE)
 		bcm_can_tx(op);
 
@@ -1183,9 +1187,6 @@ static int bcm_rx_setup(struct bcm_msg_h
 			     HRTIMER_MODE_REL_SOFT);
 		op->thrtimer.function = bcm_rx_thr_handler;
 
-		/* add this bcm_op to the list of the rx_ops */
-		list_add(&op->list, &bo->rx_ops);
-
 		/* call can_rx_register() */
 		do_rx_register = 1;
 
@@ -1264,10 +1265,12 @@ static int bcm_rx_setup(struct bcm_msg_h
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
@@ -1597,8 +1600,10 @@ static int bcm_release(struct socket *so
 		remove_proc_entry(bo->procname, net->can.bcmproc_dir);
 #endif /* CONFIG_PROC_FS */
 
-	list_for_each_entry_safe(op, next, &bo->tx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->tx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
 		/*
@@ -1629,8 +1634,10 @@ static int bcm_release(struct socket *so
 
 	synchronize_rcu();
 
-	list_for_each_entry_safe(op, next, &bo->rx_ops, list)
+	list_for_each_entry_safe(op, next, &bo->rx_ops, list) {
+		list_del_rcu(&op->list);
 		bcm_remove_op(op);
+	}
 
 	/* remove device reference */
 	if (bo->bound) {


Patches currently in stable-queue which might be from socketcan@hartkopp.net are

queue-5.10/can-isotp-use-unconditional-synchronize_rcu-in-isotp_release.patch
queue-5.10/can-bcm-fix-lockless-bound-ifindex-race-and-silent-rx_setup-failure.patch
queue-5.10/can-bcm-add-missing-rcu-list-annotations-and-operations.patch
